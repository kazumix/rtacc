; ModuleID = 'md5c.c'
source_filename = "md5c.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

@PADDING = internal global <{ i8, [63 x i8] }> <{ i8 -128, [63 x i8] zeroinitializer }>, align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local void @MD5Init(ptr noundef writeonly captures(none) initializes((0, 24)) %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 16
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 20
  store i32 0, ptr %3, align 4
  store i32 0, ptr %2, align 4
  store <4 x i32> <i32 1732584193, i32 -271733879, i32 -1732584194, i32 271733878>, ptr %0, align 4
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local void @MD5Update(ptr noundef captures(none) %0, ptr noundef readonly captures(none) %1, i32 noundef %2) local_unnamed_addr #1 {
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 16
  %5 = load i32, ptr %4, align 4
  %6 = lshr i32 %5, 3
  %7 = and i32 %6, 63
  %8 = shl i32 %2, 3
  %9 = add i32 %5, %8
  store i32 %9, ptr %4, align 4
  %10 = icmp ult i32 %9, %8
  %11 = getelementptr inbounds nuw i8, ptr %0, i32 20
  %12 = load i32, ptr %11, align 4
  %13 = zext i1 %10 to i32
  %14 = add i32 %12, %13
  %15 = lshr i32 %2, 29
  %16 = getelementptr inbounds nuw i8, ptr %0, i32 20
  %17 = add i32 %14, %15
  store i32 %17, ptr %16, align 4
  %18 = sub nuw nsw i32 64, %7
  %19 = icmp ult i32 %2, %18
  br i1 %19, label %31, label %20

20:                                               ; preds = %3
  %21 = getelementptr inbounds nuw i8, ptr %0, i32 24
  %22 = getelementptr inbounds nuw i8, ptr %21, i32 %7
  tail call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(1) %22, ptr noundef nonnull readonly align 1 dereferenceable(1) %1, i32 %18, i1 false)
  tail call fastcc void @MD5Transform(ptr noundef nonnull %0, ptr noundef nonnull %21)
  %23 = xor i32 %7, 127
  %24 = icmp ult i32 %23, %2
  br i1 %24, label %25, label %31

25:                                               ; preds = %20, %25
  %26 = phi i32 [ %28, %25 ], [ %18, %20 ]
  %27 = getelementptr inbounds nuw i8, ptr %1, i32 %26
  tail call fastcc void @MD5Transform(ptr noundef nonnull %0, ptr noundef nonnull %27)
  %28 = add i32 %26, 64
  %29 = add i32 %26, 127
  %30 = icmp ult i32 %29, %2
  br i1 %30, label %25, label %31, !llvm.loop !7

31:                                               ; preds = %25, %20, %3
  %32 = phi i32 [ %7, %3 ], [ 0, %20 ], [ 0, %25 ]
  %33 = phi i32 [ 0, %3 ], [ %18, %20 ], [ %28, %25 ]
  %34 = sub i32 %2, %33
  %35 = getelementptr inbounds nuw i8, ptr %1, i32 %33
  %36 = getelementptr inbounds nuw i8, ptr %0, i32 24
  %37 = getelementptr inbounds nuw i8, ptr %36, i32 %32
  tail call void @llvm.memcpy.p0.p0.i32(ptr nonnull align 1 %37, ptr readonly align 1 %35, i32 %34, i1 false)
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define internal fastcc void @MD5Transform(ptr noundef captures(none) %0, ptr noundef readonly captures(none) %1) unnamed_addr #3 {
  %3 = load i32, ptr %0, align 4
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %5 = load i32, ptr %4, align 4
  %6 = getelementptr inbounds nuw i8, ptr %0, i32 8
  %7 = load i32, ptr %6, align 4
  %8 = getelementptr inbounds nuw i8, ptr %0, i32 12
  %9 = load i32, ptr %8, align 4
  %10 = load i32, ptr %1, align 1
  %11 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %12 = load i32, ptr %11, align 1
  %13 = getelementptr inbounds nuw i8, ptr %1, i32 8
  %14 = load i32, ptr %13, align 1
  %15 = getelementptr inbounds nuw i8, ptr %1, i32 12
  %16 = load i32, ptr %15, align 1
  %17 = getelementptr inbounds nuw i8, ptr %1, i32 16
  %18 = load i32, ptr %17, align 1
  %19 = getelementptr inbounds nuw i8, ptr %1, i32 20
  %20 = load i32, ptr %19, align 1
  %21 = getelementptr inbounds nuw i8, ptr %1, i32 24
  %22 = load i32, ptr %21, align 1
  %23 = getelementptr inbounds nuw i8, ptr %1, i32 28
  %24 = load i32, ptr %23, align 1
  %25 = getelementptr inbounds nuw i8, ptr %1, i32 32
  %26 = load i32, ptr %25, align 1
  %27 = getelementptr inbounds nuw i8, ptr %1, i32 36
  %28 = load i32, ptr %27, align 1
  %29 = getelementptr inbounds nuw i8, ptr %1, i32 40
  %30 = load i32, ptr %29, align 1
  %31 = getelementptr inbounds nuw i8, ptr %1, i32 44
  %32 = load i32, ptr %31, align 1
  %33 = getelementptr inbounds nuw i8, ptr %1, i32 48
  %34 = load i32, ptr %33, align 1
  %35 = getelementptr inbounds nuw i8, ptr %1, i32 52
  %36 = load i32, ptr %35, align 1
  %37 = getelementptr inbounds nuw i8, ptr %1, i32 56
  %38 = load i32, ptr %37, align 1
  %39 = getelementptr inbounds nuw i8, ptr %1, i32 60
  %40 = load i32, ptr %39, align 1
  %41 = and i32 %7, %5
  %42 = xor i32 %5, -1
  %43 = and i32 %9, %42
  %44 = or i32 %43, %41
  %45 = add i32 %3, -680876936
  %46 = add i32 %45, %10
  %47 = add i32 %46, %44
  %48 = tail call i32 @llvm.fshl.i32(i32 %47, i32 %47, i32 7)
  %49 = add i32 %48, %5
  %50 = and i32 %49, %5
  %51 = xor i32 %49, -1
  %52 = and i32 %7, %51
  %53 = or i32 %50, %52
  %54 = add i32 %9, -389564586
  %55 = add i32 %54, %12
  %56 = add i32 %55, %53
  %57 = tail call i32 @llvm.fshl.i32(i32 %56, i32 %56, i32 12)
  %58 = add i32 %57, %49
  %59 = and i32 %58, %49
  %60 = xor i32 %58, -1
  %61 = and i32 %5, %60
  %62 = or i32 %59, %61
  %63 = add i32 %7, 606105819
  %64 = add i32 %63, %14
  %65 = add i32 %64, %62
  %66 = tail call i32 @llvm.fshl.i32(i32 %65, i32 %65, i32 17)
  %67 = add i32 %66, %58
  %68 = and i32 %67, %58
  %69 = xor i32 %67, -1
  %70 = and i32 %49, %69
  %71 = or i32 %68, %70
  %72 = add i32 %5, -1044525330
  %73 = add i32 %72, %16
  %74 = add i32 %73, %71
  %75 = tail call i32 @llvm.fshl.i32(i32 %74, i32 %74, i32 22)
  %76 = add i32 %75, %67
  %77 = and i32 %76, %67
  %78 = xor i32 %76, -1
  %79 = and i32 %58, %78
  %80 = or i32 %77, %79
  %81 = add i32 %18, -176418897
  %82 = add i32 %81, %49
  %83 = add i32 %82, %80
  %84 = tail call i32 @llvm.fshl.i32(i32 %83, i32 %83, i32 7)
  %85 = add i32 %84, %76
  %86 = and i32 %85, %76
  %87 = xor i32 %85, -1
  %88 = and i32 %67, %87
  %89 = or i32 %86, %88
  %90 = add i32 %20, 1200080426
  %91 = add i32 %90, %58
  %92 = add i32 %91, %89
  %93 = tail call i32 @llvm.fshl.i32(i32 %92, i32 %92, i32 12)
  %94 = add i32 %93, %85
  %95 = and i32 %94, %85
  %96 = xor i32 %94, -1
  %97 = and i32 %76, %96
  %98 = or i32 %95, %97
  %99 = add i32 %22, -1473231341
  %100 = add i32 %99, %67
  %101 = add i32 %100, %98
  %102 = tail call i32 @llvm.fshl.i32(i32 %101, i32 %101, i32 17)
  %103 = add i32 %102, %94
  %104 = and i32 %103, %94
  %105 = xor i32 %103, -1
  %106 = and i32 %85, %105
  %107 = or i32 %104, %106
  %108 = add i32 %24, -45705983
  %109 = add i32 %108, %76
  %110 = add i32 %109, %107
  %111 = tail call i32 @llvm.fshl.i32(i32 %110, i32 %110, i32 22)
  %112 = add i32 %111, %103
  %113 = and i32 %112, %103
  %114 = xor i32 %112, -1
  %115 = and i32 %94, %114
  %116 = or i32 %113, %115
  %117 = add i32 %26, 1770035416
  %118 = add i32 %117, %85
  %119 = add i32 %118, %116
  %120 = tail call i32 @llvm.fshl.i32(i32 %119, i32 %119, i32 7)
  %121 = add i32 %120, %112
  %122 = and i32 %121, %112
  %123 = xor i32 %121, -1
  %124 = and i32 %103, %123
  %125 = or i32 %122, %124
  %126 = add i32 %28, -1958414417
  %127 = add i32 %126, %94
  %128 = add i32 %127, %125
  %129 = tail call i32 @llvm.fshl.i32(i32 %128, i32 %128, i32 12)
  %130 = add i32 %129, %121
  %131 = and i32 %130, %121
  %132 = xor i32 %130, -1
  %133 = and i32 %112, %132
  %134 = or i32 %131, %133
  %135 = add i32 %30, -42063
  %136 = add i32 %135, %103
  %137 = add i32 %136, %134
  %138 = tail call i32 @llvm.fshl.i32(i32 %137, i32 %137, i32 17)
  %139 = add i32 %138, %130
  %140 = and i32 %139, %130
  %141 = xor i32 %139, -1
  %142 = and i32 %121, %141
  %143 = or i32 %140, %142
  %144 = add i32 %32, -1990404162
  %145 = add i32 %144, %112
  %146 = add i32 %145, %143
  %147 = tail call i32 @llvm.fshl.i32(i32 %146, i32 %146, i32 22)
  %148 = add i32 %147, %139
  %149 = and i32 %148, %139
  %150 = xor i32 %148, -1
  %151 = and i32 %130, %150
  %152 = or i32 %149, %151
  %153 = add i32 %34, 1804603682
  %154 = add i32 %153, %121
  %155 = add i32 %154, %152
  %156 = tail call i32 @llvm.fshl.i32(i32 %155, i32 %155, i32 7)
  %157 = add i32 %156, %148
  %158 = and i32 %157, %148
  %159 = xor i32 %157, -1
  %160 = and i32 %139, %159
  %161 = or i32 %158, %160
  %162 = add i32 %36, -40341101
  %163 = add i32 %162, %130
  %164 = add i32 %163, %161
  %165 = tail call i32 @llvm.fshl.i32(i32 %164, i32 %164, i32 12)
  %166 = add i32 %165, %157
  %167 = and i32 %166, %157
  %168 = xor i32 %166, -1
  %169 = and i32 %148, %168
  %170 = or i32 %167, %169
  %171 = add i32 %38, -1502002290
  %172 = add i32 %171, %139
  %173 = add i32 %172, %170
  %174 = tail call i32 @llvm.fshl.i32(i32 %173, i32 %173, i32 17)
  %175 = add i32 %174, %166
  %176 = and i32 %175, %166
  %177 = xor i32 %175, -1
  %178 = and i32 %157, %177
  %179 = or i32 %176, %178
  %180 = add i32 %40, 1236535329
  %181 = add i32 %180, %148
  %182 = add i32 %181, %179
  %183 = tail call i32 @llvm.fshl.i32(i32 %182, i32 %182, i32 22)
  %184 = add i32 %183, %175
  %185 = and i32 %184, %166
  %186 = and i32 %175, %168
  %187 = or i32 %185, %186
  %188 = add i32 %12, -165796510
  %189 = add i32 %188, %157
  %190 = add i32 %189, %187
  %191 = tail call i32 @llvm.fshl.i32(i32 %190, i32 %190, i32 5)
  %192 = add i32 %191, %184
  %193 = and i32 %192, %175
  %194 = and i32 %184, %177
  %195 = or i32 %193, %194
  %196 = add i32 %22, -1069501632
  %197 = add i32 %196, %166
  %198 = add i32 %197, %195
  %199 = tail call i32 @llvm.fshl.i32(i32 %198, i32 %198, i32 9)
  %200 = add i32 %199, %192
  %201 = and i32 %200, %184
  %202 = xor i32 %184, -1
  %203 = and i32 %192, %202
  %204 = or i32 %201, %203
  %205 = add i32 %32, 643717713
  %206 = add i32 %205, %175
  %207 = add i32 %206, %204
  %208 = tail call i32 @llvm.fshl.i32(i32 %207, i32 %207, i32 14)
  %209 = add i32 %208, %200
  %210 = and i32 %209, %192
  %211 = xor i32 %192, -1
  %212 = and i32 %200, %211
  %213 = or i32 %210, %212
  %214 = add i32 %10, -373897302
  %215 = add i32 %214, %184
  %216 = add i32 %215, %213
  %217 = tail call i32 @llvm.fshl.i32(i32 %216, i32 %216, i32 20)
  %218 = add i32 %217, %209
  %219 = and i32 %218, %200
  %220 = xor i32 %200, -1
  %221 = and i32 %209, %220
  %222 = or i32 %219, %221
  %223 = add i32 %20, -701558691
  %224 = add i32 %223, %192
  %225 = add i32 %224, %222
  %226 = tail call i32 @llvm.fshl.i32(i32 %225, i32 %225, i32 5)
  %227 = add i32 %226, %218
  %228 = and i32 %227, %209
  %229 = xor i32 %209, -1
  %230 = and i32 %218, %229
  %231 = or i32 %228, %230
  %232 = add i32 %30, 38016083
  %233 = add i32 %232, %200
  %234 = add i32 %233, %231
  %235 = tail call i32 @llvm.fshl.i32(i32 %234, i32 %234, i32 9)
  %236 = add i32 %235, %227
  %237 = and i32 %236, %218
  %238 = xor i32 %218, -1
  %239 = and i32 %227, %238
  %240 = or i32 %237, %239
  %241 = add i32 %40, -660478335
  %242 = add i32 %241, %209
  %243 = add i32 %242, %240
  %244 = tail call i32 @llvm.fshl.i32(i32 %243, i32 %243, i32 14)
  %245 = add i32 %244, %236
  %246 = and i32 %245, %227
  %247 = xor i32 %227, -1
  %248 = and i32 %236, %247
  %249 = or i32 %246, %248
  %250 = add i32 %18, -405537848
  %251 = add i32 %250, %218
  %252 = add i32 %251, %249
  %253 = tail call i32 @llvm.fshl.i32(i32 %252, i32 %252, i32 20)
  %254 = add i32 %253, %245
  %255 = and i32 %254, %236
  %256 = xor i32 %236, -1
  %257 = and i32 %245, %256
  %258 = or i32 %255, %257
  %259 = add i32 %28, 568446438
  %260 = add i32 %259, %227
  %261 = add i32 %260, %258
  %262 = tail call i32 @llvm.fshl.i32(i32 %261, i32 %261, i32 5)
  %263 = add i32 %262, %254
  %264 = and i32 %263, %245
  %265 = xor i32 %245, -1
  %266 = and i32 %254, %265
  %267 = or i32 %264, %266
  %268 = add i32 %38, -1019803690
  %269 = add i32 %268, %236
  %270 = add i32 %269, %267
  %271 = tail call i32 @llvm.fshl.i32(i32 %270, i32 %270, i32 9)
  %272 = add i32 %271, %263
  %273 = and i32 %272, %254
  %274 = xor i32 %254, -1
  %275 = and i32 %263, %274
  %276 = or i32 %273, %275
  %277 = add i32 %16, -187363961
  %278 = add i32 %277, %245
  %279 = add i32 %278, %276
  %280 = tail call i32 @llvm.fshl.i32(i32 %279, i32 %279, i32 14)
  %281 = add i32 %280, %272
  %282 = and i32 %281, %263
  %283 = xor i32 %263, -1
  %284 = and i32 %272, %283
  %285 = or i32 %282, %284
  %286 = add i32 %26, 1163531501
  %287 = add i32 %286, %254
  %288 = add i32 %287, %285
  %289 = tail call i32 @llvm.fshl.i32(i32 %288, i32 %288, i32 20)
  %290 = add i32 %289, %281
  %291 = and i32 %290, %272
  %292 = xor i32 %272, -1
  %293 = and i32 %281, %292
  %294 = or i32 %291, %293
  %295 = add i32 %36, -1444681467
  %296 = add i32 %295, %263
  %297 = add i32 %296, %294
  %298 = tail call i32 @llvm.fshl.i32(i32 %297, i32 %297, i32 5)
  %299 = add i32 %298, %290
  %300 = and i32 %299, %281
  %301 = xor i32 %281, -1
  %302 = and i32 %290, %301
  %303 = or i32 %300, %302
  %304 = add i32 %14, -51403784
  %305 = add i32 %304, %272
  %306 = add i32 %305, %303
  %307 = tail call i32 @llvm.fshl.i32(i32 %306, i32 %306, i32 9)
  %308 = add i32 %307, %299
  %309 = and i32 %308, %290
  %310 = xor i32 %290, -1
  %311 = and i32 %299, %310
  %312 = or i32 %309, %311
  %313 = add i32 %24, 1735328473
  %314 = add i32 %313, %281
  %315 = add i32 %314, %312
  %316 = tail call i32 @llvm.fshl.i32(i32 %315, i32 %315, i32 14)
  %317 = add i32 %316, %308
  %318 = and i32 %317, %299
  %319 = xor i32 %299, -1
  %320 = and i32 %308, %319
  %321 = or i32 %318, %320
  %322 = add i32 %34, -1926607734
  %323 = add i32 %322, %290
  %324 = add i32 %323, %321
  %325 = tail call i32 @llvm.fshl.i32(i32 %324, i32 %324, i32 20)
  %326 = add i32 %325, %317
  %327 = xor i32 %326, %317
  %328 = xor i32 %327, %308
  %329 = add i32 %20, -378558
  %330 = add i32 %329, %299
  %331 = add i32 %330, %328
  %332 = tail call i32 @llvm.fshl.i32(i32 %331, i32 %331, i32 4)
  %333 = add i32 %332, %326
  %334 = xor i32 %327, %333
  %335 = add i32 %26, -2022574463
  %336 = add i32 %335, %308
  %337 = add i32 %336, %334
  %338 = tail call i32 @llvm.fshl.i32(i32 %337, i32 %337, i32 11)
  %339 = add i32 %338, %333
  %340 = xor i32 %333, %326
  %341 = xor i32 %340, %339
  %342 = add i32 %32, 1839030562
  %343 = add i32 %342, %317
  %344 = add i32 %343, %341
  %345 = tail call i32 @llvm.fshl.i32(i32 %344, i32 %344, i32 16)
  %346 = add i32 %345, %339
  %347 = xor i32 %339, %333
  %348 = xor i32 %347, %346
  %349 = add i32 %38, -35309556
  %350 = add i32 %349, %326
  %351 = add i32 %350, %348
  %352 = tail call i32 @llvm.fshl.i32(i32 %351, i32 %351, i32 23)
  %353 = add i32 %352, %346
  %354 = xor i32 %346, %339
  %355 = xor i32 %354, %353
  %356 = add i32 %12, -1530992060
  %357 = add i32 %356, %333
  %358 = add i32 %357, %355
  %359 = tail call i32 @llvm.fshl.i32(i32 %358, i32 %358, i32 4)
  %360 = add i32 %359, %353
  %361 = xor i32 %353, %346
  %362 = xor i32 %361, %360
  %363 = add i32 %18, 1272893353
  %364 = add i32 %363, %339
  %365 = add i32 %364, %362
  %366 = tail call i32 @llvm.fshl.i32(i32 %365, i32 %365, i32 11)
  %367 = add i32 %366, %360
  %368 = xor i32 %360, %353
  %369 = xor i32 %368, %367
  %370 = add i32 %24, -155497632
  %371 = add i32 %370, %346
  %372 = add i32 %371, %369
  %373 = tail call i32 @llvm.fshl.i32(i32 %372, i32 %372, i32 16)
  %374 = add i32 %373, %367
  %375 = xor i32 %367, %360
  %376 = xor i32 %375, %374
  %377 = add i32 %30, -1094730640
  %378 = add i32 %377, %353
  %379 = add i32 %378, %376
  %380 = tail call i32 @llvm.fshl.i32(i32 %379, i32 %379, i32 23)
  %381 = add i32 %380, %374
  %382 = xor i32 %374, %367
  %383 = xor i32 %382, %381
  %384 = add i32 %36, 681279174
  %385 = add i32 %384, %360
  %386 = add i32 %385, %383
  %387 = tail call i32 @llvm.fshl.i32(i32 %386, i32 %386, i32 4)
  %388 = add i32 %387, %381
  %389 = xor i32 %381, %374
  %390 = xor i32 %389, %388
  %391 = add i32 %10, -358537222
  %392 = add i32 %391, %367
  %393 = add i32 %392, %390
  %394 = tail call i32 @llvm.fshl.i32(i32 %393, i32 %393, i32 11)
  %395 = add i32 %394, %388
  %396 = xor i32 %388, %381
  %397 = xor i32 %396, %395
  %398 = add i32 %16, -722521979
  %399 = add i32 %398, %374
  %400 = add i32 %399, %397
  %401 = tail call i32 @llvm.fshl.i32(i32 %400, i32 %400, i32 16)
  %402 = add i32 %401, %395
  %403 = xor i32 %395, %388
  %404 = xor i32 %403, %402
  %405 = add i32 %22, 76029189
  %406 = add i32 %405, %381
  %407 = add i32 %406, %404
  %408 = tail call i32 @llvm.fshl.i32(i32 %407, i32 %407, i32 23)
  %409 = add i32 %408, %402
  %410 = xor i32 %402, %395
  %411 = xor i32 %410, %409
  %412 = add i32 %28, -640364487
  %413 = add i32 %412, %388
  %414 = add i32 %413, %411
  %415 = tail call i32 @llvm.fshl.i32(i32 %414, i32 %414, i32 4)
  %416 = add i32 %415, %409
  %417 = xor i32 %409, %402
  %418 = xor i32 %417, %416
  %419 = add i32 %34, -421815835
  %420 = add i32 %419, %395
  %421 = add i32 %420, %418
  %422 = tail call i32 @llvm.fshl.i32(i32 %421, i32 %421, i32 11)
  %423 = add i32 %422, %416
  %424 = xor i32 %416, %409
  %425 = xor i32 %424, %423
  %426 = add i32 %40, 530742520
  %427 = add i32 %426, %402
  %428 = add i32 %427, %425
  %429 = tail call i32 @llvm.fshl.i32(i32 %428, i32 %428, i32 16)
  %430 = add i32 %429, %423
  %431 = xor i32 %423, %416
  %432 = xor i32 %431, %430
  %433 = add i32 %14, -995338651
  %434 = add i32 %433, %409
  %435 = add i32 %434, %432
  %436 = tail call i32 @llvm.fshl.i32(i32 %435, i32 %435, i32 23)
  %437 = add i32 %436, %430
  %438 = xor i32 %423, -1
  %439 = or i32 %437, %438
  %440 = xor i32 %439, %430
  %441 = add i32 %10, -198630844
  %442 = add i32 %441, %416
  %443 = add i32 %442, %440
  %444 = tail call i32 @llvm.fshl.i32(i32 %443, i32 %443, i32 6)
  %445 = add i32 %444, %437
  %446 = xor i32 %430, -1
  %447 = or i32 %445, %446
  %448 = xor i32 %447, %437
  %449 = add i32 %24, 1126891415
  %450 = add i32 %449, %423
  %451 = add i32 %450, %448
  %452 = tail call i32 @llvm.fshl.i32(i32 %451, i32 %451, i32 10)
  %453 = add i32 %452, %445
  %454 = xor i32 %437, -1
  %455 = or i32 %453, %454
  %456 = xor i32 %455, %445
  %457 = add i32 %38, -1416354905
  %458 = add i32 %457, %430
  %459 = add i32 %458, %456
  %460 = tail call i32 @llvm.fshl.i32(i32 %459, i32 %459, i32 15)
  %461 = add i32 %460, %453
  %462 = xor i32 %445, -1
  %463 = or i32 %461, %462
  %464 = xor i32 %463, %453
  %465 = add i32 %20, -57434055
  %466 = add i32 %465, %437
  %467 = add i32 %466, %464
  %468 = tail call i32 @llvm.fshl.i32(i32 %467, i32 %467, i32 21)
  %469 = add i32 %468, %461
  %470 = xor i32 %453, -1
  %471 = or i32 %469, %470
  %472 = xor i32 %471, %461
  %473 = add i32 %34, 1700485571
  %474 = add i32 %473, %445
  %475 = add i32 %474, %472
  %476 = tail call i32 @llvm.fshl.i32(i32 %475, i32 %475, i32 6)
  %477 = add i32 %476, %469
  %478 = xor i32 %461, -1
  %479 = or i32 %477, %478
  %480 = xor i32 %479, %469
  %481 = add i32 %16, -1894986606
  %482 = add i32 %481, %453
  %483 = add i32 %482, %480
  %484 = tail call i32 @llvm.fshl.i32(i32 %483, i32 %483, i32 10)
  %485 = add i32 %484, %477
  %486 = xor i32 %469, -1
  %487 = or i32 %485, %486
  %488 = xor i32 %487, %477
  %489 = add i32 %30, -1051523
  %490 = add i32 %489, %461
  %491 = add i32 %490, %488
  %492 = tail call i32 @llvm.fshl.i32(i32 %491, i32 %491, i32 15)
  %493 = add i32 %492, %485
  %494 = xor i32 %477, -1
  %495 = or i32 %493, %494
  %496 = xor i32 %495, %485
  %497 = add i32 %12, -2054922799
  %498 = add i32 %497, %469
  %499 = add i32 %498, %496
  %500 = tail call i32 @llvm.fshl.i32(i32 %499, i32 %499, i32 21)
  %501 = add i32 %500, %493
  %502 = xor i32 %485, -1
  %503 = or i32 %501, %502
  %504 = xor i32 %503, %493
  %505 = add i32 %26, 1873313359
  %506 = add i32 %505, %477
  %507 = add i32 %506, %504
  %508 = tail call i32 @llvm.fshl.i32(i32 %507, i32 %507, i32 6)
  %509 = add i32 %508, %501
  %510 = xor i32 %493, -1
  %511 = or i32 %509, %510
  %512 = xor i32 %511, %501
  %513 = add i32 %40, -30611744
  %514 = add i32 %513, %485
  %515 = add i32 %514, %512
  %516 = tail call i32 @llvm.fshl.i32(i32 %515, i32 %515, i32 10)
  %517 = add i32 %516, %509
  %518 = xor i32 %501, -1
  %519 = or i32 %517, %518
  %520 = xor i32 %519, %509
  %521 = add i32 %22, -1560198380
  %522 = add i32 %521, %493
  %523 = add i32 %522, %520
  %524 = tail call i32 @llvm.fshl.i32(i32 %523, i32 %523, i32 15)
  %525 = add i32 %524, %517
  %526 = xor i32 %509, -1
  %527 = or i32 %525, %526
  %528 = xor i32 %527, %517
  %529 = add i32 %36, 1309151649
  %530 = add i32 %529, %501
  %531 = add i32 %530, %528
  %532 = tail call i32 @llvm.fshl.i32(i32 %531, i32 %531, i32 21)
  %533 = add i32 %532, %525
  %534 = xor i32 %517, -1
  %535 = or i32 %533, %534
  %536 = xor i32 %535, %525
  %537 = add i32 %18, -145523070
  %538 = add i32 %537, %509
  %539 = add i32 %538, %536
  %540 = tail call i32 @llvm.fshl.i32(i32 %539, i32 %539, i32 6)
  %541 = add i32 %540, %533
  %542 = xor i32 %525, -1
  %543 = or i32 %541, %542
  %544 = xor i32 %543, %533
  %545 = add i32 %32, -1120210379
  %546 = add i32 %545, %517
  %547 = add i32 %546, %544
  %548 = tail call i32 @llvm.fshl.i32(i32 %547, i32 %547, i32 10)
  %549 = add i32 %548, %541
  %550 = xor i32 %533, -1
  %551 = or i32 %549, %550
  %552 = xor i32 %551, %541
  %553 = add i32 %14, 718787259
  %554 = add i32 %553, %525
  %555 = add i32 %554, %552
  %556 = tail call i32 @llvm.fshl.i32(i32 %555, i32 %555, i32 15)
  %557 = add i32 %556, %549
  %558 = xor i32 %541, -1
  %559 = or i32 %557, %558
  %560 = xor i32 %559, %549
  %561 = add i32 %28, -343485551
  %562 = add i32 %561, %533
  %563 = add i32 %562, %560
  %564 = tail call i32 @llvm.fshl.i32(i32 %563, i32 %563, i32 21)
  %565 = add i32 %541, %3
  store i32 %565, ptr %0, align 4
  %566 = add i32 %557, %5
  %567 = add i32 %566, %564
  store i32 %567, ptr %4, align 4
  %568 = add i32 %557, %7
  store i32 %568, ptr %6, align 4
  %569 = add i32 %549, %9
  store i32 %569, ptr %8, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @MD5Final(ptr noundef writeonly captures(none) %0, ptr noundef captures(none) %1) local_unnamed_addr #4 {
  %3 = alloca [8 x i8], align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #8
  %4 = getelementptr inbounds nuw i8, ptr %1, i32 16
  %5 = load i64, ptr %4, align 4
  store i64 %5, ptr %3, align 1
  %6 = load i32, ptr %4, align 4
  %7 = lshr i32 %6, 3
  %8 = and i32 %7, 63
  %9 = icmp samesign ult i32 %8, 56
  %10 = select i1 %9, i32 56, i32 120
  %11 = sub nsw i32 %10, %8
  %12 = shl nsw i32 %11, 3
  %13 = add i32 %12, %6
  store i32 %13, ptr %4, align 4
  %14 = icmp ult i32 %13, %12
  %15 = getelementptr inbounds nuw i8, ptr %1, i32 20
  %16 = load i32, ptr %15, align 4
  %17 = zext i1 %14 to i32
  %18 = lshr i32 %11, 29
  %19 = add i32 %18, %16
  %20 = add i32 %19, %17
  store i32 %20, ptr %15, align 4
  %21 = sub nuw nsw i32 64, %8
  %22 = icmp ult i32 %11, %21
  br i1 %22, label %34, label %23

23:                                               ; preds = %2
  %24 = getelementptr inbounds nuw i8, ptr %1, i32 24
  %25 = getelementptr inbounds nuw i8, ptr %24, i32 %8
  tail call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(1) %25, ptr noundef nonnull readonly align 1 dereferenceable(1) @PADDING, i32 %21, i1 false)
  tail call fastcc void @MD5Transform(ptr noundef nonnull %1, ptr noundef nonnull %24)
  %26 = xor i32 %8, 127
  %27 = icmp ult i32 %26, %11
  br i1 %27, label %28, label %34

28:                                               ; preds = %23, %28
  %29 = phi i32 [ %31, %28 ], [ %21, %23 ]
  %30 = getelementptr inbounds nuw i8, ptr @PADDING, i32 %29
  tail call fastcc void @MD5Transform(ptr noundef nonnull %1, ptr noundef nonnull readonly %30)
  %31 = add i32 %29, 64
  %32 = add i32 %29, 127
  %33 = icmp ult i32 %32, %11
  br i1 %33, label %28, label %34, !llvm.loop !7

34:                                               ; preds = %28, %2, %23
  %35 = phi i32 [ %8, %2 ], [ 0, %23 ], [ 0, %28 ]
  %36 = phi i32 [ 0, %2 ], [ %21, %23 ], [ %31, %28 ]
  %37 = sub i32 %11, %36
  %38 = getelementptr inbounds nuw i8, ptr @PADDING, i32 %36
  %39 = getelementptr inbounds nuw i8, ptr %1, i32 24
  %40 = getelementptr inbounds nuw i8, ptr %39, i32 %35
  tail call void @llvm.memcpy.p0.p0.i32(ptr nonnull align 1 %40, ptr nonnull readonly align 1 %38, i32 %37, i1 false)
  %41 = load i32, ptr %4, align 4
  %42 = lshr i32 %41, 3
  %43 = and i32 %42, 63
  %44 = add i32 %41, 64
  store i32 %44, ptr %4, align 4
  %45 = icmp ugt i32 %41, -65
  %46 = load i32, ptr %15, align 4
  %47 = zext i1 %45 to i32
  %48 = add i32 %46, %47
  store i32 %48, ptr %15, align 4
  %49 = icmp samesign ult i32 %43, 56
  br i1 %49, label %53, label %50

50:                                               ; preds = %34
  %51 = sub nuw nsw i32 64, %43
  %52 = getelementptr inbounds nuw i8, ptr %39, i32 %43
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(1) %52, ptr noundef nonnull readonly align 1 dereferenceable(1) %3, i32 %51, i1 false)
  tail call fastcc void @MD5Transform(ptr noundef nonnull %1, ptr noundef nonnull %39)
  br label %53

53:                                               ; preds = %50, %34
  %54 = phi i32 [ %43, %34 ], [ 0, %50 ]
  %55 = phi i32 [ 0, %34 ], [ %51, %50 ]
  %56 = sub nuw nsw i32 8, %55
  %57 = getelementptr inbounds nuw i8, ptr %3, i32 %55
  %58 = getelementptr inbounds nuw i8, ptr %39, i32 %54
  call void @llvm.memcpy.p0.p0.i32(ptr nonnull align 1 %58, ptr nonnull readonly align 1 %57, i32 %56, i1 false)
  %59 = load i32, ptr %1, align 4
  %60 = trunc i32 %59 to i8
  store i8 %60, ptr %0, align 1
  %61 = load i32, ptr %1, align 4
  %62 = lshr i32 %61, 8
  %63 = trunc i32 %62 to i8
  %64 = getelementptr inbounds nuw i8, ptr %0, i32 1
  store i8 %63, ptr %64, align 1
  %65 = load i32, ptr %1, align 4
  %66 = lshr i32 %65, 16
  %67 = trunc i32 %66 to i8
  %68 = getelementptr inbounds nuw i8, ptr %0, i32 2
  store i8 %67, ptr %68, align 1
  %69 = load i32, ptr %1, align 4
  %70 = lshr i32 %69, 24
  %71 = trunc nuw i32 %70 to i8
  %72 = getelementptr inbounds nuw i8, ptr %0, i32 3
  store i8 %71, ptr %72, align 1
  %73 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %74 = load i32, ptr %73, align 4
  %75 = trunc i32 %74 to i8
  %76 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i8 %75, ptr %76, align 1
  %77 = load i32, ptr %73, align 4
  %78 = lshr i32 %77, 8
  %79 = trunc i32 %78 to i8
  %80 = getelementptr inbounds nuw i8, ptr %0, i32 5
  store i8 %79, ptr %80, align 1
  %81 = load i32, ptr %73, align 4
  %82 = lshr i32 %81, 16
  %83 = trunc i32 %82 to i8
  %84 = getelementptr inbounds nuw i8, ptr %0, i32 6
  store i8 %83, ptr %84, align 1
  %85 = load i32, ptr %73, align 4
  %86 = lshr i32 %85, 24
  %87 = trunc nuw i32 %86 to i8
  %88 = getelementptr inbounds nuw i8, ptr %0, i32 7
  store i8 %87, ptr %88, align 1
  %89 = getelementptr inbounds nuw i8, ptr %1, i32 8
  %90 = load i32, ptr %89, align 4
  %91 = trunc i32 %90 to i8
  %92 = getelementptr inbounds nuw i8, ptr %0, i32 8
  store i8 %91, ptr %92, align 1
  %93 = load i32, ptr %89, align 4
  %94 = lshr i32 %93, 8
  %95 = trunc i32 %94 to i8
  %96 = getelementptr inbounds nuw i8, ptr %0, i32 9
  store i8 %95, ptr %96, align 1
  %97 = load i32, ptr %89, align 4
  %98 = lshr i32 %97, 16
  %99 = trunc i32 %98 to i8
  %100 = getelementptr inbounds nuw i8, ptr %0, i32 10
  store i8 %99, ptr %100, align 1
  %101 = load i32, ptr %89, align 4
  %102 = lshr i32 %101, 24
  %103 = trunc nuw i32 %102 to i8
  %104 = getelementptr inbounds nuw i8, ptr %0, i32 11
  store i8 %103, ptr %104, align 1
  %105 = getelementptr inbounds nuw i8, ptr %1, i32 12
  %106 = load i32, ptr %105, align 4
  %107 = trunc i32 %106 to i8
  %108 = getelementptr inbounds nuw i8, ptr %0, i32 12
  store i8 %107, ptr %108, align 1
  %109 = load i32, ptr %105, align 4
  %110 = lshr i32 %109, 8
  %111 = trunc i32 %110 to i8
  %112 = getelementptr inbounds nuw i8, ptr %0, i32 13
  store i8 %111, ptr %112, align 1
  %113 = load i32, ptr %105, align 4
  %114 = lshr i32 %113, 16
  %115 = trunc i32 %114 to i8
  %116 = getelementptr inbounds nuw i8, ptr %0, i32 14
  store i8 %115, ptr %116, align 1
  %117 = load i32, ptr %105, align 4
  %118 = lshr i32 %117, 24
  %119 = trunc nuw i32 %118 to i8
  %120 = getelementptr inbounds nuw i8, ptr %0, i32 15
  store i8 %119, ptr %120, align 1
  tail call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(88) %1, i8 0, i32 88, i1 false)
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #5

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i32(ptr writeonly captures(none), i8, i32, i1 immarg) #6

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fshl.i32(i32, i32, i32) #7

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #7 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "md5c.c", directory: "D:\\work\\rtacc\\examples\\PLCP")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
