; ModuleID = '..\PLCP\string.c'
source_filename = "..\\PLCP\\string.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.STRING = type <{ i16, [81 x i8] }>

$LibVersion_0x0701 = comdat any

@LibVersion_0x0701 = weak_odr dso_local local_unnamed_addr global i32 1, comdat, align 4
@status_string = dso_local local_unnamed_addr global i32 0, align 4

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local void @String_Clear(ptr noundef writeonly captures(none) initializes((0, 3)) %0) local_unnamed_addr #0 {
  store i16 0, ptr %0, align 1
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 2
  store i8 0, ptr %2, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite)
define dso_local void @String_Set(ptr noundef initializes((0, 2)) %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #1 {
  %3 = tail call i32 @strlen(ptr noundef nonnull dereferenceable(1) %1) #9
  %4 = tail call i32 @llvm.smin.i32(i32 %3, i32 80)
  %5 = trunc i32 %4 to i16
  store i16 %5, ptr %0, align 1
  %6 = getelementptr inbounds nuw i8, ptr %0, i32 2
  %7 = tail call ptr @strncpy(ptr noundef nonnull dereferenceable(1) %6, ptr noundef nonnull dereferenceable(1) %1, i32 noundef 80) #9
  ret void
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare dso_local i32 @strlen(ptr noundef captures(none)) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare dso_local ptr @strncpy(ptr noalias noundef returned writeonly, ptr noalias noundef readonly captures(none), i32 noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite)
define dso_local void @String_Create(ptr dead_on_unwind noalias writable sret(%struct.STRING) align 1 initializes((0, 2)) %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #1 {
  %3 = tail call i32 @strlen(ptr noundef nonnull dereferenceable(1) %1) #9
  %4 = tail call i32 @llvm.smin.i32(i32 %3, i32 80)
  %5 = trunc i32 %4 to i16
  store i16 %5, ptr %0, align 1
  %6 = getelementptr inbounds nuw i8, ptr %0, i32 2
  %7 = tail call ptr @strncpy(ptr noundef nonnull %6, ptr noundef nonnull %1, i32 noundef %3) #9
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local nonnull ptr @String_Get(ptr noundef readnone captures(ret: address, provenance) %0) local_unnamed_addr #4 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 2
  ret ptr %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local void @String_Copy(ptr noundef writeonly captures(address_is_null) %0, ptr noundef readonly captures(address_is_null) %1) local_unnamed_addr #5 {
  %3 = icmp ne ptr %0, null
  %4 = icmp ne ptr %1, null
  %5 = and i1 %3, %4
  br i1 %5, label %6, label %7

6:                                                ; preds = %2
  tail call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(83) %0, ptr noundef nonnull align 1 dereferenceable(83) %1, i32 83, i1 false)
  br label %7

7:                                                ; preds = %6, %2
  ret void
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #6

; Function Attrs: nofree norecurse nounwind memory(argmem: readwrite)
define dso_local range(i32 0, 8198) i32 @String_Packing(ptr noundef captures(address) %0) local_unnamed_addr #7 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %273, label %3

3:                                                ; preds = %1
  %4 = tail call i32 @strlen(ptr noundef nonnull dereferenceable(1) %0) #9
  %5 = icmp slt i32 %4, 2
  br i1 %5, label %273, label %6

6:                                                ; preds = %3, %24
  %7 = phi i32 [ %26, %24 ], [ 0, %3 ]
  %8 = phi ptr [ %25, %24 ], [ %0, %3 ]
  %9 = load i8, ptr %8, align 1
  switch i8 %9, label %24 [
    i8 0, label %273
    i8 39, label %10
    i8 34, label %10
  ]

10:                                               ; preds = %6, %6
  %11 = getelementptr inbounds nuw i8, ptr %0, i32 %4
  %12 = getelementptr inbounds nuw i8, ptr %8, i32 1
  %13 = getelementptr i8, ptr %0, i32 %4
  br label %14

14:                                               ; preds = %20, %10
  %15 = phi i32 [ %23, %20 ], [ 0, %10 ]
  %16 = phi ptr [ %21, %20 ], [ %13, %10 ]
  %17 = phi ptr [ %18, %20 ], [ %11, %10 ]
  %18 = getelementptr inbounds i8, ptr %17, i32 -1
  %19 = icmp ult ptr %18, %12
  br i1 %19, label %273, label %20

20:                                               ; preds = %14
  %21 = getelementptr i8, ptr %16, i32 -1
  %22 = load i8, ptr %18, align 1
  %23 = add i32 %15, 1
  switch i8 %22, label %14 [
    i8 39, label %27
    i8 34, label %27
  ], !llvm.loop !7

24:                                               ; preds = %6
  %25 = getelementptr inbounds nuw i8, ptr %8, i32 1
  %26 = add i32 %7, 1
  br label %6, !llvm.loop !9

27:                                               ; preds = %20, %20
  store i8 2, ptr %8, align 1
  store i8 3, ptr %18, align 1
  %28 = icmp ult ptr %12, %18
  br i1 %28, label %29, label %273

29:                                               ; preds = %27
  %30 = add nsw i32 %4, -2
  %31 = add i32 %7, %15
  %32 = sub i32 %30, %31
  %33 = icmp ult i32 %32, 8
  br i1 %33, label %263, label %34

34:                                               ; preds = %29
  %35 = icmp ult i32 %32, 32
  br i1 %35, label %212, label %36

36:                                               ; preds = %34
  %37 = and i32 %32, 24
  %38 = and i32 %32, -32
  br label %39

39:                                               ; preds = %204, %36
  %40 = phi i32 [ 0, %36 ], [ %205, %204 ]
  %41 = getelementptr i8, ptr %12, i32 %40
  %42 = getelementptr i8, ptr %12, i32 %40
  %43 = getelementptr i8, ptr %42, i32 1
  %44 = getelementptr i8, ptr %12, i32 %40
  %45 = getelementptr i8, ptr %44, i32 2
  %46 = getelementptr i8, ptr %12, i32 %40
  %47 = getelementptr i8, ptr %46, i32 3
  %48 = getelementptr i8, ptr %12, i32 %40
  %49 = getelementptr i8, ptr %48, i32 4
  %50 = getelementptr i8, ptr %12, i32 %40
  %51 = getelementptr i8, ptr %50, i32 5
  %52 = getelementptr i8, ptr %12, i32 %40
  %53 = getelementptr i8, ptr %52, i32 6
  %54 = getelementptr i8, ptr %12, i32 %40
  %55 = getelementptr i8, ptr %54, i32 7
  %56 = getelementptr i8, ptr %12, i32 %40
  %57 = getelementptr i8, ptr %56, i32 8
  %58 = getelementptr i8, ptr %12, i32 %40
  %59 = getelementptr i8, ptr %58, i32 9
  %60 = getelementptr i8, ptr %12, i32 %40
  %61 = getelementptr i8, ptr %60, i32 10
  %62 = getelementptr i8, ptr %12, i32 %40
  %63 = getelementptr i8, ptr %62, i32 11
  %64 = getelementptr i8, ptr %12, i32 %40
  %65 = getelementptr i8, ptr %64, i32 12
  %66 = getelementptr i8, ptr %12, i32 %40
  %67 = getelementptr i8, ptr %66, i32 13
  %68 = getelementptr i8, ptr %12, i32 %40
  %69 = getelementptr i8, ptr %68, i32 14
  %70 = getelementptr i8, ptr %12, i32 %40
  %71 = getelementptr i8, ptr %70, i32 15
  %72 = getelementptr i8, ptr %12, i32 %40
  %73 = getelementptr i8, ptr %72, i32 16
  %74 = getelementptr i8, ptr %12, i32 %40
  %75 = getelementptr i8, ptr %74, i32 17
  %76 = getelementptr i8, ptr %12, i32 %40
  %77 = getelementptr i8, ptr %76, i32 18
  %78 = getelementptr i8, ptr %12, i32 %40
  %79 = getelementptr i8, ptr %78, i32 19
  %80 = getelementptr i8, ptr %12, i32 %40
  %81 = getelementptr i8, ptr %80, i32 20
  %82 = getelementptr i8, ptr %12, i32 %40
  %83 = getelementptr i8, ptr %82, i32 21
  %84 = getelementptr i8, ptr %12, i32 %40
  %85 = getelementptr i8, ptr %84, i32 22
  %86 = getelementptr i8, ptr %12, i32 %40
  %87 = getelementptr i8, ptr %86, i32 23
  %88 = getelementptr i8, ptr %12, i32 %40
  %89 = getelementptr i8, ptr %88, i32 24
  %90 = getelementptr i8, ptr %12, i32 %40
  %91 = getelementptr i8, ptr %90, i32 25
  %92 = getelementptr i8, ptr %12, i32 %40
  %93 = getelementptr i8, ptr %92, i32 26
  %94 = getelementptr i8, ptr %12, i32 %40
  %95 = getelementptr i8, ptr %94, i32 27
  %96 = getelementptr i8, ptr %12, i32 %40
  %97 = getelementptr i8, ptr %96, i32 28
  %98 = getelementptr i8, ptr %12, i32 %40
  %99 = getelementptr i8, ptr %98, i32 29
  %100 = getelementptr i8, ptr %12, i32 %40
  %101 = getelementptr i8, ptr %100, i32 30
  %102 = getelementptr i8, ptr %12, i32 %40
  %103 = getelementptr i8, ptr %102, i32 31
  %104 = getelementptr i8, ptr %41, i32 16
  %105 = load <16 x i8>, ptr %41, align 1
  %106 = load <16 x i8>, ptr %104, align 1
  %107 = icmp eq <16 x i8> %105, splat (i8 32)
  %108 = icmp eq <16 x i8> %106, splat (i8 32)
  %109 = extractelement <16 x i1> %107, i64 0
  br i1 %109, label %110, label %111

110:                                              ; preds = %39
  store i8 1, ptr %41, align 1
  br label %111

111:                                              ; preds = %110, %39
  %112 = extractelement <16 x i1> %107, i64 1
  br i1 %112, label %113, label %114

113:                                              ; preds = %111
  store i8 1, ptr %43, align 1
  br label %114

114:                                              ; preds = %113, %111
  %115 = extractelement <16 x i1> %107, i64 2
  br i1 %115, label %116, label %117

116:                                              ; preds = %114
  store i8 1, ptr %45, align 1
  br label %117

117:                                              ; preds = %116, %114
  %118 = extractelement <16 x i1> %107, i64 3
  br i1 %118, label %119, label %120

119:                                              ; preds = %117
  store i8 1, ptr %47, align 1
  br label %120

120:                                              ; preds = %119, %117
  %121 = extractelement <16 x i1> %107, i64 4
  br i1 %121, label %122, label %123

122:                                              ; preds = %120
  store i8 1, ptr %49, align 1
  br label %123

123:                                              ; preds = %122, %120
  %124 = extractelement <16 x i1> %107, i64 5
  br i1 %124, label %125, label %126

125:                                              ; preds = %123
  store i8 1, ptr %51, align 1
  br label %126

126:                                              ; preds = %125, %123
  %127 = extractelement <16 x i1> %107, i64 6
  br i1 %127, label %128, label %129

128:                                              ; preds = %126
  store i8 1, ptr %53, align 1
  br label %129

129:                                              ; preds = %128, %126
  %130 = extractelement <16 x i1> %107, i64 7
  br i1 %130, label %131, label %132

131:                                              ; preds = %129
  store i8 1, ptr %55, align 1
  br label %132

132:                                              ; preds = %131, %129
  %133 = extractelement <16 x i1> %107, i64 8
  br i1 %133, label %134, label %135

134:                                              ; preds = %132
  store i8 1, ptr %57, align 1
  br label %135

135:                                              ; preds = %134, %132
  %136 = extractelement <16 x i1> %107, i64 9
  br i1 %136, label %137, label %138

137:                                              ; preds = %135
  store i8 1, ptr %59, align 1
  br label %138

138:                                              ; preds = %137, %135
  %139 = extractelement <16 x i1> %107, i64 10
  br i1 %139, label %140, label %141

140:                                              ; preds = %138
  store i8 1, ptr %61, align 1
  br label %141

141:                                              ; preds = %140, %138
  %142 = extractelement <16 x i1> %107, i64 11
  br i1 %142, label %143, label %144

143:                                              ; preds = %141
  store i8 1, ptr %63, align 1
  br label %144

144:                                              ; preds = %143, %141
  %145 = extractelement <16 x i1> %107, i64 12
  br i1 %145, label %146, label %147

146:                                              ; preds = %144
  store i8 1, ptr %65, align 1
  br label %147

147:                                              ; preds = %146, %144
  %148 = extractelement <16 x i1> %107, i64 13
  br i1 %148, label %149, label %150

149:                                              ; preds = %147
  store i8 1, ptr %67, align 1
  br label %150

150:                                              ; preds = %149, %147
  %151 = extractelement <16 x i1> %107, i64 14
  br i1 %151, label %152, label %153

152:                                              ; preds = %150
  store i8 1, ptr %69, align 1
  br label %153

153:                                              ; preds = %152, %150
  %154 = extractelement <16 x i1> %107, i64 15
  br i1 %154, label %155, label %156

155:                                              ; preds = %153
  store i8 1, ptr %71, align 1
  br label %156

156:                                              ; preds = %155, %153
  %157 = extractelement <16 x i1> %108, i64 0
  br i1 %157, label %158, label %159

158:                                              ; preds = %156
  store i8 1, ptr %73, align 1
  br label %159

159:                                              ; preds = %158, %156
  %160 = extractelement <16 x i1> %108, i64 1
  br i1 %160, label %161, label %162

161:                                              ; preds = %159
  store i8 1, ptr %75, align 1
  br label %162

162:                                              ; preds = %161, %159
  %163 = extractelement <16 x i1> %108, i64 2
  br i1 %163, label %164, label %165

164:                                              ; preds = %162
  store i8 1, ptr %77, align 1
  br label %165

165:                                              ; preds = %164, %162
  %166 = extractelement <16 x i1> %108, i64 3
  br i1 %166, label %167, label %168

167:                                              ; preds = %165
  store i8 1, ptr %79, align 1
  br label %168

168:                                              ; preds = %167, %165
  %169 = extractelement <16 x i1> %108, i64 4
  br i1 %169, label %170, label %171

170:                                              ; preds = %168
  store i8 1, ptr %81, align 1
  br label %171

171:                                              ; preds = %170, %168
  %172 = extractelement <16 x i1> %108, i64 5
  br i1 %172, label %173, label %174

173:                                              ; preds = %171
  store i8 1, ptr %83, align 1
  br label %174

174:                                              ; preds = %173, %171
  %175 = extractelement <16 x i1> %108, i64 6
  br i1 %175, label %176, label %177

176:                                              ; preds = %174
  store i8 1, ptr %85, align 1
  br label %177

177:                                              ; preds = %176, %174
  %178 = extractelement <16 x i1> %108, i64 7
  br i1 %178, label %179, label %180

179:                                              ; preds = %177
  store i8 1, ptr %87, align 1
  br label %180

180:                                              ; preds = %179, %177
  %181 = extractelement <16 x i1> %108, i64 8
  br i1 %181, label %182, label %183

182:                                              ; preds = %180
  store i8 1, ptr %89, align 1
  br label %183

183:                                              ; preds = %182, %180
  %184 = extractelement <16 x i1> %108, i64 9
  br i1 %184, label %185, label %186

185:                                              ; preds = %183
  store i8 1, ptr %91, align 1
  br label %186

186:                                              ; preds = %185, %183
  %187 = extractelement <16 x i1> %108, i64 10
  br i1 %187, label %188, label %189

188:                                              ; preds = %186
  store i8 1, ptr %93, align 1
  br label %189

189:                                              ; preds = %188, %186
  %190 = extractelement <16 x i1> %108, i64 11
  br i1 %190, label %191, label %192

191:                                              ; preds = %189
  store i8 1, ptr %95, align 1
  br label %192

192:                                              ; preds = %191, %189
  %193 = extractelement <16 x i1> %108, i64 12
  br i1 %193, label %194, label %195

194:                                              ; preds = %192
  store i8 1, ptr %97, align 1
  br label %195

195:                                              ; preds = %194, %192
  %196 = extractelement <16 x i1> %108, i64 13
  br i1 %196, label %197, label %198

197:                                              ; preds = %195
  store i8 1, ptr %99, align 1
  br label %198

198:                                              ; preds = %197, %195
  %199 = extractelement <16 x i1> %108, i64 14
  br i1 %199, label %200, label %201

200:                                              ; preds = %198
  store i8 1, ptr %101, align 1
  br label %201

201:                                              ; preds = %200, %198
  %202 = extractelement <16 x i1> %108, i64 15
  br i1 %202, label %203, label %204

203:                                              ; preds = %201
  store i8 1, ptr %103, align 1
  br label %204

204:                                              ; preds = %203, %201
  %205 = add nuw i32 %40, 32
  %206 = icmp eq i32 %205, %38
  br i1 %206, label %207, label %39, !llvm.loop !10

207:                                              ; preds = %204
  %208 = icmp eq i32 %32, %38
  br i1 %208, label %273, label %209

209:                                              ; preds = %207
  %210 = getelementptr i8, ptr %12, i32 %38
  %211 = icmp eq i32 %37, 0
  br i1 %211, label %263, label %212, !prof !13

212:                                              ; preds = %34, %209
  %213 = phi i32 [ %38, %209 ], [ 0, %34 ]
  %214 = and i32 %32, -8
  %215 = getelementptr i8, ptr %12, i32 %214
  br label %216

216:                                              ; preds = %258, %212
  %217 = phi i32 [ %213, %212 ], [ %259, %258 ]
  %218 = getelementptr i8, ptr %12, i32 %217
  %219 = getelementptr i8, ptr %12, i32 %217
  %220 = getelementptr i8, ptr %219, i32 1
  %221 = getelementptr i8, ptr %12, i32 %217
  %222 = getelementptr i8, ptr %221, i32 2
  %223 = getelementptr i8, ptr %12, i32 %217
  %224 = getelementptr i8, ptr %223, i32 3
  %225 = getelementptr i8, ptr %12, i32 %217
  %226 = getelementptr i8, ptr %225, i32 4
  %227 = getelementptr i8, ptr %12, i32 %217
  %228 = getelementptr i8, ptr %227, i32 5
  %229 = getelementptr i8, ptr %12, i32 %217
  %230 = getelementptr i8, ptr %229, i32 6
  %231 = getelementptr i8, ptr %12, i32 %217
  %232 = getelementptr i8, ptr %231, i32 7
  %233 = load <8 x i8>, ptr %218, align 1
  %234 = icmp eq <8 x i8> %233, splat (i8 32)
  %235 = extractelement <8 x i1> %234, i64 0
  br i1 %235, label %236, label %237

236:                                              ; preds = %216
  store i8 1, ptr %218, align 1
  br label %237

237:                                              ; preds = %236, %216
  %238 = extractelement <8 x i1> %234, i64 1
  br i1 %238, label %239, label %240

239:                                              ; preds = %237
  store i8 1, ptr %220, align 1
  br label %240

240:                                              ; preds = %239, %237
  %241 = extractelement <8 x i1> %234, i64 2
  br i1 %241, label %242, label %243

242:                                              ; preds = %240
  store i8 1, ptr %222, align 1
  br label %243

243:                                              ; preds = %242, %240
  %244 = extractelement <8 x i1> %234, i64 3
  br i1 %244, label %245, label %246

245:                                              ; preds = %243
  store i8 1, ptr %224, align 1
  br label %246

246:                                              ; preds = %245, %243
  %247 = extractelement <8 x i1> %234, i64 4
  br i1 %247, label %248, label %249

248:                                              ; preds = %246
  store i8 1, ptr %226, align 1
  br label %249

249:                                              ; preds = %248, %246
  %250 = extractelement <8 x i1> %234, i64 5
  br i1 %250, label %251, label %252

251:                                              ; preds = %249
  store i8 1, ptr %228, align 1
  br label %252

252:                                              ; preds = %251, %249
  %253 = extractelement <8 x i1> %234, i64 6
  br i1 %253, label %254, label %255

254:                                              ; preds = %252
  store i8 1, ptr %230, align 1
  br label %255

255:                                              ; preds = %254, %252
  %256 = extractelement <8 x i1> %234, i64 7
  br i1 %256, label %257, label %258

257:                                              ; preds = %255
  store i8 1, ptr %232, align 1
  br label %258

258:                                              ; preds = %257, %255
  %259 = add nuw i32 %217, 8
  %260 = icmp eq i32 %259, %214
  br i1 %260, label %261, label %216, !llvm.loop !14

261:                                              ; preds = %258
  %262 = icmp eq i32 %32, %214
  br i1 %262, label %273, label %263

263:                                              ; preds = %29, %209, %261
  %264 = phi ptr [ %12, %29 ], [ %210, %209 ], [ %215, %261 ]
  br label %265

265:                                              ; preds = %263, %270
  %266 = phi ptr [ %271, %270 ], [ %264, %263 ]
  %267 = load i8, ptr %266, align 1
  %268 = icmp eq i8 %267, 32
  br i1 %268, label %269, label %270

269:                                              ; preds = %265
  store i8 1, ptr %266, align 1
  br label %270

270:                                              ; preds = %269, %265
  %271 = getelementptr inbounds nuw i8, ptr %266, i32 1
  %272 = icmp eq ptr %271, %21
  br i1 %272, label %273, label %265, !llvm.loop !15

273:                                              ; preds = %6, %14, %270, %207, %261, %27, %3, %1
  %274 = phi i32 [ 0, %1 ], [ 0, %3 ], [ 0, %27 ], [ 8197, %14 ], [ 0, %207 ], [ 0, %270 ], [ 0, %261 ], [ 0, %6 ]
  ret i32 %274
}

; Function Attrs: nofree norecurse nounwind memory(argmem: readwrite)
define dso_local range(i32 0, 8198) i32 @String_Unpacking(ptr noundef captures(address) %0) local_unnamed_addr #7 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %274, label %3

3:                                                ; preds = %1
  %4 = tail call i32 @strlen(ptr noundef nonnull dereferenceable(1) %0) #9
  %5 = icmp slt i32 %4, 2
  br i1 %5, label %274, label %6

6:                                                ; preds = %3, %25
  %7 = phi i32 [ %27, %25 ], [ 0, %3 ]
  %8 = phi ptr [ %26, %25 ], [ %0, %3 ]
  %9 = load i8, ptr %8, align 1
  switch i8 %9, label %25 [
    i8 0, label %274
    i8 2, label %10
  ]

10:                                               ; preds = %6
  %11 = getelementptr inbounds nuw i8, ptr %0, i32 %4
  %12 = getelementptr inbounds nuw i8, ptr %8, i32 1
  %13 = getelementptr i8, ptr %0, i32 %4
  br label %14

14:                                               ; preds = %20, %10
  %15 = phi i32 [ %24, %20 ], [ 0, %10 ]
  %16 = phi ptr [ %21, %20 ], [ %13, %10 ]
  %17 = phi ptr [ %18, %20 ], [ %11, %10 ]
  %18 = getelementptr inbounds i8, ptr %17, i32 -1
  %19 = icmp ult ptr %18, %12
  br i1 %19, label %274, label %20

20:                                               ; preds = %14
  %21 = getelementptr i8, ptr %16, i32 -1
  %22 = load i8, ptr %18, align 1
  %23 = icmp eq i8 %22, 3
  %24 = add i32 %15, 1
  br i1 %23, label %28, label %14, !llvm.loop !16

25:                                               ; preds = %6
  %26 = getelementptr inbounds nuw i8, ptr %8, i32 1
  %27 = add i32 %7, 1
  br label %6, !llvm.loop !17

28:                                               ; preds = %20
  store i8 39, ptr %8, align 1
  store i8 39, ptr %18, align 1
  %29 = icmp ult ptr %12, %18
  br i1 %29, label %30, label %274

30:                                               ; preds = %28
  %31 = add nsw i32 %4, -2
  %32 = add i32 %7, %15
  %33 = sub i32 %31, %32
  %34 = icmp ult i32 %33, 8
  br i1 %34, label %264, label %35

35:                                               ; preds = %30
  %36 = icmp ult i32 %33, 32
  br i1 %36, label %213, label %37

37:                                               ; preds = %35
  %38 = and i32 %33, 24
  %39 = and i32 %33, -32
  br label %40

40:                                               ; preds = %205, %37
  %41 = phi i32 [ 0, %37 ], [ %206, %205 ]
  %42 = getelementptr i8, ptr %12, i32 %41
  %43 = getelementptr i8, ptr %12, i32 %41
  %44 = getelementptr i8, ptr %43, i32 1
  %45 = getelementptr i8, ptr %12, i32 %41
  %46 = getelementptr i8, ptr %45, i32 2
  %47 = getelementptr i8, ptr %12, i32 %41
  %48 = getelementptr i8, ptr %47, i32 3
  %49 = getelementptr i8, ptr %12, i32 %41
  %50 = getelementptr i8, ptr %49, i32 4
  %51 = getelementptr i8, ptr %12, i32 %41
  %52 = getelementptr i8, ptr %51, i32 5
  %53 = getelementptr i8, ptr %12, i32 %41
  %54 = getelementptr i8, ptr %53, i32 6
  %55 = getelementptr i8, ptr %12, i32 %41
  %56 = getelementptr i8, ptr %55, i32 7
  %57 = getelementptr i8, ptr %12, i32 %41
  %58 = getelementptr i8, ptr %57, i32 8
  %59 = getelementptr i8, ptr %12, i32 %41
  %60 = getelementptr i8, ptr %59, i32 9
  %61 = getelementptr i8, ptr %12, i32 %41
  %62 = getelementptr i8, ptr %61, i32 10
  %63 = getelementptr i8, ptr %12, i32 %41
  %64 = getelementptr i8, ptr %63, i32 11
  %65 = getelementptr i8, ptr %12, i32 %41
  %66 = getelementptr i8, ptr %65, i32 12
  %67 = getelementptr i8, ptr %12, i32 %41
  %68 = getelementptr i8, ptr %67, i32 13
  %69 = getelementptr i8, ptr %12, i32 %41
  %70 = getelementptr i8, ptr %69, i32 14
  %71 = getelementptr i8, ptr %12, i32 %41
  %72 = getelementptr i8, ptr %71, i32 15
  %73 = getelementptr i8, ptr %12, i32 %41
  %74 = getelementptr i8, ptr %73, i32 16
  %75 = getelementptr i8, ptr %12, i32 %41
  %76 = getelementptr i8, ptr %75, i32 17
  %77 = getelementptr i8, ptr %12, i32 %41
  %78 = getelementptr i8, ptr %77, i32 18
  %79 = getelementptr i8, ptr %12, i32 %41
  %80 = getelementptr i8, ptr %79, i32 19
  %81 = getelementptr i8, ptr %12, i32 %41
  %82 = getelementptr i8, ptr %81, i32 20
  %83 = getelementptr i8, ptr %12, i32 %41
  %84 = getelementptr i8, ptr %83, i32 21
  %85 = getelementptr i8, ptr %12, i32 %41
  %86 = getelementptr i8, ptr %85, i32 22
  %87 = getelementptr i8, ptr %12, i32 %41
  %88 = getelementptr i8, ptr %87, i32 23
  %89 = getelementptr i8, ptr %12, i32 %41
  %90 = getelementptr i8, ptr %89, i32 24
  %91 = getelementptr i8, ptr %12, i32 %41
  %92 = getelementptr i8, ptr %91, i32 25
  %93 = getelementptr i8, ptr %12, i32 %41
  %94 = getelementptr i8, ptr %93, i32 26
  %95 = getelementptr i8, ptr %12, i32 %41
  %96 = getelementptr i8, ptr %95, i32 27
  %97 = getelementptr i8, ptr %12, i32 %41
  %98 = getelementptr i8, ptr %97, i32 28
  %99 = getelementptr i8, ptr %12, i32 %41
  %100 = getelementptr i8, ptr %99, i32 29
  %101 = getelementptr i8, ptr %12, i32 %41
  %102 = getelementptr i8, ptr %101, i32 30
  %103 = getelementptr i8, ptr %12, i32 %41
  %104 = getelementptr i8, ptr %103, i32 31
  %105 = getelementptr i8, ptr %42, i32 16
  %106 = load <16 x i8>, ptr %42, align 1
  %107 = load <16 x i8>, ptr %105, align 1
  %108 = icmp eq <16 x i8> %106, splat (i8 1)
  %109 = icmp eq <16 x i8> %107, splat (i8 1)
  %110 = extractelement <16 x i1> %108, i64 0
  br i1 %110, label %111, label %112

111:                                              ; preds = %40
  store i8 32, ptr %42, align 1
  br label %112

112:                                              ; preds = %111, %40
  %113 = extractelement <16 x i1> %108, i64 1
  br i1 %113, label %114, label %115

114:                                              ; preds = %112
  store i8 32, ptr %44, align 1
  br label %115

115:                                              ; preds = %114, %112
  %116 = extractelement <16 x i1> %108, i64 2
  br i1 %116, label %117, label %118

117:                                              ; preds = %115
  store i8 32, ptr %46, align 1
  br label %118

118:                                              ; preds = %117, %115
  %119 = extractelement <16 x i1> %108, i64 3
  br i1 %119, label %120, label %121

120:                                              ; preds = %118
  store i8 32, ptr %48, align 1
  br label %121

121:                                              ; preds = %120, %118
  %122 = extractelement <16 x i1> %108, i64 4
  br i1 %122, label %123, label %124

123:                                              ; preds = %121
  store i8 32, ptr %50, align 1
  br label %124

124:                                              ; preds = %123, %121
  %125 = extractelement <16 x i1> %108, i64 5
  br i1 %125, label %126, label %127

126:                                              ; preds = %124
  store i8 32, ptr %52, align 1
  br label %127

127:                                              ; preds = %126, %124
  %128 = extractelement <16 x i1> %108, i64 6
  br i1 %128, label %129, label %130

129:                                              ; preds = %127
  store i8 32, ptr %54, align 1
  br label %130

130:                                              ; preds = %129, %127
  %131 = extractelement <16 x i1> %108, i64 7
  br i1 %131, label %132, label %133

132:                                              ; preds = %130
  store i8 32, ptr %56, align 1
  br label %133

133:                                              ; preds = %132, %130
  %134 = extractelement <16 x i1> %108, i64 8
  br i1 %134, label %135, label %136

135:                                              ; preds = %133
  store i8 32, ptr %58, align 1
  br label %136

136:                                              ; preds = %135, %133
  %137 = extractelement <16 x i1> %108, i64 9
  br i1 %137, label %138, label %139

138:                                              ; preds = %136
  store i8 32, ptr %60, align 1
  br label %139

139:                                              ; preds = %138, %136
  %140 = extractelement <16 x i1> %108, i64 10
  br i1 %140, label %141, label %142

141:                                              ; preds = %139
  store i8 32, ptr %62, align 1
  br label %142

142:                                              ; preds = %141, %139
  %143 = extractelement <16 x i1> %108, i64 11
  br i1 %143, label %144, label %145

144:                                              ; preds = %142
  store i8 32, ptr %64, align 1
  br label %145

145:                                              ; preds = %144, %142
  %146 = extractelement <16 x i1> %108, i64 12
  br i1 %146, label %147, label %148

147:                                              ; preds = %145
  store i8 32, ptr %66, align 1
  br label %148

148:                                              ; preds = %147, %145
  %149 = extractelement <16 x i1> %108, i64 13
  br i1 %149, label %150, label %151

150:                                              ; preds = %148
  store i8 32, ptr %68, align 1
  br label %151

151:                                              ; preds = %150, %148
  %152 = extractelement <16 x i1> %108, i64 14
  br i1 %152, label %153, label %154

153:                                              ; preds = %151
  store i8 32, ptr %70, align 1
  br label %154

154:                                              ; preds = %153, %151
  %155 = extractelement <16 x i1> %108, i64 15
  br i1 %155, label %156, label %157

156:                                              ; preds = %154
  store i8 32, ptr %72, align 1
  br label %157

157:                                              ; preds = %156, %154
  %158 = extractelement <16 x i1> %109, i64 0
  br i1 %158, label %159, label %160

159:                                              ; preds = %157
  store i8 32, ptr %74, align 1
  br label %160

160:                                              ; preds = %159, %157
  %161 = extractelement <16 x i1> %109, i64 1
  br i1 %161, label %162, label %163

162:                                              ; preds = %160
  store i8 32, ptr %76, align 1
  br label %163

163:                                              ; preds = %162, %160
  %164 = extractelement <16 x i1> %109, i64 2
  br i1 %164, label %165, label %166

165:                                              ; preds = %163
  store i8 32, ptr %78, align 1
  br label %166

166:                                              ; preds = %165, %163
  %167 = extractelement <16 x i1> %109, i64 3
  br i1 %167, label %168, label %169

168:                                              ; preds = %166
  store i8 32, ptr %80, align 1
  br label %169

169:                                              ; preds = %168, %166
  %170 = extractelement <16 x i1> %109, i64 4
  br i1 %170, label %171, label %172

171:                                              ; preds = %169
  store i8 32, ptr %82, align 1
  br label %172

172:                                              ; preds = %171, %169
  %173 = extractelement <16 x i1> %109, i64 5
  br i1 %173, label %174, label %175

174:                                              ; preds = %172
  store i8 32, ptr %84, align 1
  br label %175

175:                                              ; preds = %174, %172
  %176 = extractelement <16 x i1> %109, i64 6
  br i1 %176, label %177, label %178

177:                                              ; preds = %175
  store i8 32, ptr %86, align 1
  br label %178

178:                                              ; preds = %177, %175
  %179 = extractelement <16 x i1> %109, i64 7
  br i1 %179, label %180, label %181

180:                                              ; preds = %178
  store i8 32, ptr %88, align 1
  br label %181

181:                                              ; preds = %180, %178
  %182 = extractelement <16 x i1> %109, i64 8
  br i1 %182, label %183, label %184

183:                                              ; preds = %181
  store i8 32, ptr %90, align 1
  br label %184

184:                                              ; preds = %183, %181
  %185 = extractelement <16 x i1> %109, i64 9
  br i1 %185, label %186, label %187

186:                                              ; preds = %184
  store i8 32, ptr %92, align 1
  br label %187

187:                                              ; preds = %186, %184
  %188 = extractelement <16 x i1> %109, i64 10
  br i1 %188, label %189, label %190

189:                                              ; preds = %187
  store i8 32, ptr %94, align 1
  br label %190

190:                                              ; preds = %189, %187
  %191 = extractelement <16 x i1> %109, i64 11
  br i1 %191, label %192, label %193

192:                                              ; preds = %190
  store i8 32, ptr %96, align 1
  br label %193

193:                                              ; preds = %192, %190
  %194 = extractelement <16 x i1> %109, i64 12
  br i1 %194, label %195, label %196

195:                                              ; preds = %193
  store i8 32, ptr %98, align 1
  br label %196

196:                                              ; preds = %195, %193
  %197 = extractelement <16 x i1> %109, i64 13
  br i1 %197, label %198, label %199

198:                                              ; preds = %196
  store i8 32, ptr %100, align 1
  br label %199

199:                                              ; preds = %198, %196
  %200 = extractelement <16 x i1> %109, i64 14
  br i1 %200, label %201, label %202

201:                                              ; preds = %199
  store i8 32, ptr %102, align 1
  br label %202

202:                                              ; preds = %201, %199
  %203 = extractelement <16 x i1> %109, i64 15
  br i1 %203, label %204, label %205

204:                                              ; preds = %202
  store i8 32, ptr %104, align 1
  br label %205

205:                                              ; preds = %204, %202
  %206 = add nuw i32 %41, 32
  %207 = icmp eq i32 %206, %39
  br i1 %207, label %208, label %40, !llvm.loop !18

208:                                              ; preds = %205
  %209 = icmp eq i32 %33, %39
  br i1 %209, label %274, label %210

210:                                              ; preds = %208
  %211 = getelementptr i8, ptr %12, i32 %39
  %212 = icmp eq i32 %38, 0
  br i1 %212, label %264, label %213, !prof !13

213:                                              ; preds = %35, %210
  %214 = phi i32 [ %39, %210 ], [ 0, %35 ]
  %215 = and i32 %33, -8
  %216 = getelementptr i8, ptr %12, i32 %215
  br label %217

217:                                              ; preds = %259, %213
  %218 = phi i32 [ %214, %213 ], [ %260, %259 ]
  %219 = getelementptr i8, ptr %12, i32 %218
  %220 = getelementptr i8, ptr %12, i32 %218
  %221 = getelementptr i8, ptr %220, i32 1
  %222 = getelementptr i8, ptr %12, i32 %218
  %223 = getelementptr i8, ptr %222, i32 2
  %224 = getelementptr i8, ptr %12, i32 %218
  %225 = getelementptr i8, ptr %224, i32 3
  %226 = getelementptr i8, ptr %12, i32 %218
  %227 = getelementptr i8, ptr %226, i32 4
  %228 = getelementptr i8, ptr %12, i32 %218
  %229 = getelementptr i8, ptr %228, i32 5
  %230 = getelementptr i8, ptr %12, i32 %218
  %231 = getelementptr i8, ptr %230, i32 6
  %232 = getelementptr i8, ptr %12, i32 %218
  %233 = getelementptr i8, ptr %232, i32 7
  %234 = load <8 x i8>, ptr %219, align 1
  %235 = icmp eq <8 x i8> %234, splat (i8 1)
  %236 = extractelement <8 x i1> %235, i64 0
  br i1 %236, label %237, label %238

237:                                              ; preds = %217
  store i8 32, ptr %219, align 1
  br label %238

238:                                              ; preds = %237, %217
  %239 = extractelement <8 x i1> %235, i64 1
  br i1 %239, label %240, label %241

240:                                              ; preds = %238
  store i8 32, ptr %221, align 1
  br label %241

241:                                              ; preds = %240, %238
  %242 = extractelement <8 x i1> %235, i64 2
  br i1 %242, label %243, label %244

243:                                              ; preds = %241
  store i8 32, ptr %223, align 1
  br label %244

244:                                              ; preds = %243, %241
  %245 = extractelement <8 x i1> %235, i64 3
  br i1 %245, label %246, label %247

246:                                              ; preds = %244
  store i8 32, ptr %225, align 1
  br label %247

247:                                              ; preds = %246, %244
  %248 = extractelement <8 x i1> %235, i64 4
  br i1 %248, label %249, label %250

249:                                              ; preds = %247
  store i8 32, ptr %227, align 1
  br label %250

250:                                              ; preds = %249, %247
  %251 = extractelement <8 x i1> %235, i64 5
  br i1 %251, label %252, label %253

252:                                              ; preds = %250
  store i8 32, ptr %229, align 1
  br label %253

253:                                              ; preds = %252, %250
  %254 = extractelement <8 x i1> %235, i64 6
  br i1 %254, label %255, label %256

255:                                              ; preds = %253
  store i8 32, ptr %231, align 1
  br label %256

256:                                              ; preds = %255, %253
  %257 = extractelement <8 x i1> %235, i64 7
  br i1 %257, label %258, label %259

258:                                              ; preds = %256
  store i8 32, ptr %233, align 1
  br label %259

259:                                              ; preds = %258, %256
  %260 = add nuw i32 %218, 8
  %261 = icmp eq i32 %260, %215
  br i1 %261, label %262, label %217, !llvm.loop !19

262:                                              ; preds = %259
  %263 = icmp eq i32 %33, %215
  br i1 %263, label %274, label %264

264:                                              ; preds = %30, %210, %262
  %265 = phi ptr [ %12, %30 ], [ %211, %210 ], [ %216, %262 ]
  br label %266

266:                                              ; preds = %264, %271
  %267 = phi ptr [ %272, %271 ], [ %265, %264 ]
  %268 = load i8, ptr %267, align 1
  %269 = icmp eq i8 %268, 1
  br i1 %269, label %270, label %271

270:                                              ; preds = %266
  store i8 32, ptr %267, align 1
  br label %271

271:                                              ; preds = %270, %266
  %272 = getelementptr inbounds nuw i8, ptr %267, i32 1
  %273 = icmp eq ptr %272, %21
  br i1 %273, label %274, label %266, !llvm.loop !20

274:                                              ; preds = %6, %14, %271, %208, %262, %28, %3, %1
  %275 = phi i32 [ 0, %1 ], [ 0, %3 ], [ 0, %28 ], [ 8197, %14 ], [ 0, %208 ], [ 0, %271 ], [ 0, %262 ], [ 0, %6 ]
  ret i32 %275
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #8

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #7 = { nofree norecurse nounwind memory(argmem: readwrite) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "..\\PLCP\\string.c", directory: "C:\\D_DRV\\work\\rtacc\\examples\\SQINT")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = distinct !{!9, !8}
!10 = distinct !{!10, !8, !11, !12}
!11 = !{!"llvm.loop.isvectorized", i32 1}
!12 = !{!"llvm.loop.unroll.runtime.disable"}
!13 = !{!"branch_weights", i32 8, i32 24}
!14 = distinct !{!14, !8, !11, !12}
!15 = distinct !{!15, !8, !12, !11}
!16 = distinct !{!16, !8}
!17 = distinct !{!17, !8}
!18 = distinct !{!18, !8, !11, !12}
!19 = distinct !{!19, !8, !11, !12}
!20 = distinct !{!20, !8, !12, !11}
