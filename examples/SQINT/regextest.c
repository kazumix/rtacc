#include <stdio.h>
#include <stdlib.h>
#include <string.h>



#define	PCRE2_STATIC
#define PCRE2_CODE_UNIT_WIDTH 8
#include "..\pcre2\bin\pcre2.h"

#define MY_PATTERN "\\[(?<hours>\\d+):(?<minutes>\\d+):(?<seconds>\\d+)(\\.(?<milliseconds>\\d+))?\\] \\<(?<nickname>\\w+)\\> (?<message>.*)"
#define MY_SUBJECT "[0:00:01] <Tsoding> forsenPls forsenPls forsenPls forsenPls forsenPls forsenPls forsenPls forsenPls forsenPls forsenPls"

const char *line_comps[] = {
	"hours",
	"minutes",
	"seconds",
	"milliseconds",
	"nickname",
	"message",
};
const size_t line_comps_count = sizeof(line_comps) / sizeof(line_comps[0]);

//Regex to use : \[(? <hours>\d + ) : (? <minutes>\d + ) : (? <seconds>\d + )(\.(? <milliseconds>\d + )) ? \] \<(? <nickname>\w + )\> (? <message>.*)
//Text to parse : [0:00 : 01] <Tsoding> forsenPls forsenPls forsenPls forsenPls forsenPls forsenPls forsenPls forsenPls forsenPls forsenPls
//rc = 8
//Match succeeded at offset 0
//hours : 0
//	minutes : 00
//	seconds : 01
//	milliseconds :
//	nickname : Tsoding
//	message : forsenPls forsenPls forsenPls forsenPls forsenPls forsenPls forsenPls forsenPls forsenPls forsenPls

int main2(int argc, char *argv[])
{
	PCRE2_SPTR pattern;
	pattern = (PCRE2_SPTR)MY_PATTERN;
	printf("Regex to use: %s\n", pattern);
	printf("Text to parse: %s\n", MY_SUBJECT);

	int errorcode = 0;
	PCRE2_SIZE erroroffset = 0;
	pcre2_code *re = pcre2_compile(pattern, strlen(MY_PATTERN), 0, &errorcode, &erroroffset, NULL);

	if (re == NULL) {
		PCRE2_UCHAR buffer[256];
		pcre2_get_error_message(errorcode, buffer, sizeof(buffer));
		printf("PCRE2 compilation failed at offset %d: %s\n", (int)erroroffset, buffer);
		exit(1);
	}

	PCRE2_SPTR subject = (PCRE2_SPTR)MY_SUBJECT;     /* the appropriate width (in this case, 8 bits). */
	size_t subject_length = strlen(MY_SUBJECT);

	pcre2_match_data *match_data = pcre2_match_data_create_from_pattern(re, NULL);

	int rc = pcre2_match(
		re,                   /* the compiled pattern */
		subject,              /* the subject string */
		subject_length,       /* the length of the subject */
		0,                    /* start at offset 0 in the subject */
		0,                    /* default options */
		match_data,           /* block for storing the result */
		NULL);                /* use default match context */

	if (rc < 0) {
		switch (rc) {
		case PCRE2_ERROR_NOMATCH:
			printf("No match\n");
			break;
		default:
			printf("Matching error %d\n", rc);
			break;
		}
		exit(1);
	}

	printf("rc = %d\n", rc);

	PCRE2_SIZE *ovector = pcre2_get_ovector_pointer(match_data);
	printf("Match succeeded at offset %d\n", (int)ovector[0]);

	for (size_t i = 0; i < line_comps_count; ++i) {
		int index = pcre2_substring_number_from_name(re, (PCRE2_SPTR)line_comps[i]);
		PCRE2_SPTR substring_start = subject + ovector[2 * index];
		size_t substring_length = ovector[2 * index + 1] - ovector[2 * index];
		printf("%s: %.*s\n", line_comps[i], (int)substring_length, (char *)substring_start);
	}

	return 0;
}




