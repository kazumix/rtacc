; ModuleID = 'main.c'
source_filename = "main.c"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.44.35223"

%struct.movingave_ctx = type { ptr, i32 }

$"??_C@_0CH@NEAECOHK@repeats?$DN?$CFd?5elapsed?$DN?$CF?46f?5sec?5sink@" = comdat any

$"??_C@_0N@JLHPNFCI@src?$CIhead8?$CJ?3?5?$AA@" = comdat any

$"??_C@_05FMONJPMD@?$CF?43f?5?$AA@" = comdat any

$"??_C@_0BB@HJPOOFAK@?4?4?4?5src?$CItail4?$CJ?3?5?$AA@" = comdat any

$"??_C@_0O@BJBDEOHD@mavg?$CIhead8?$CJ?3?5?$AA@" = comdat any

$"??_C@_04LCAEPKME@NaN?5?$AA@" = comdat any

$"??_C@_05OEFBPIKG@?$CF?42f?5?$AA@" = comdat any

$"??_C@_0BC@OPNFLFPA@?4?4?4?5mavg?$CItail4?$CJ?3?5?$AA@" = comdat any

@"??_C@_0CH@NEAECOHK@repeats?$DN?$CFd?5elapsed?$DN?$CF?46f?5sec?5sink@" = linkonce_odr dso_local unnamed_addr constant [39 x i8] c"repeats=%d elapsed=%.6f sec sink=%.6f\0A\00", comdat, align 1
@"??_C@_0N@JLHPNFCI@src?$CIhead8?$CJ?3?5?$AA@" = linkonce_odr dso_local unnamed_addr constant [13 x i8] c"src(head8): \00", comdat, align 1
@"??_C@_05FMONJPMD@?$CF?43f?5?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"%.3f \00", comdat, align 1
@"??_C@_0BB@HJPOOFAK@?4?4?4?5src?$CItail4?$CJ?3?5?$AA@" = linkonce_odr dso_local unnamed_addr constant [17 x i8] c"... src(tail4): \00", comdat, align 1
@"??_C@_0O@BJBDEOHD@mavg?$CIhead8?$CJ?3?5?$AA@" = linkonce_odr dso_local unnamed_addr constant [14 x i8] c"mavg(head8): \00", comdat, align 1
@"??_C@_04LCAEPKME@NaN?5?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"NaN \00", comdat, align 1
@"??_C@_05OEFBPIKG@?$CF?42f?5?$AA@" = linkonce_odr dso_local unnamed_addr constant [6 x i8] c"%.2f \00", comdat, align 1
@"??_C@_0BC@OPNFLFPA@?4?4?4?5mavg?$CItail4?$CJ?3?5?$AA@" = linkonce_odr dso_local unnamed_addr constant [18 x i8] c"... mavg(tail4): \00", comdat, align 1

; Function Attrs: nounwind
define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = alloca %struct.movingave_ctx, align 4
  %2 = alloca double, align 8
  %3 = tail call i32 @time(ptr noundef null) #7
  tail call void @srand(i32 noundef %3) #7
  %4 = tail call dereferenceable_or_null(8192) ptr @malloc(i32 noundef 8192) #8
  %5 = tail call dereferenceable_or_null(8192) ptr @malloc(i32 noundef 8192) #8
  %6 = icmp ne ptr %4, null
  %7 = icmp ne ptr %5, null
  %8 = and i1 %6, %7
  br i1 %8, label %13, label %9

9:                                                ; preds = %0
  tail call void @free(ptr noundef %4)
  tail call void @free(ptr noundef %5)
  br label %266

10:                                               ; preds = %13
  call void @llvm.lifetime.start.p0(ptr nonnull %1) #7
  %11 = call i32 @fast_moving_average_init(ptr noundef nonnull %1, i32 noundef 1024) #7
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %23, label %22

13:                                               ; preds = %0, %13
  %14 = phi i32 [ %20, %13 ], [ 0, %0 ]
  %15 = tail call i32 @rand() #7
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 3.276700e+04
  %18 = fmul double %17, 1.000000e+01
  %19 = getelementptr inbounds nuw double, ptr %4, i32 %14
  store double %18, ptr %19, align 8
  %20 = add nuw nsw i32 %14, 1
  %21 = icmp eq i32 %20, 1024
  br i1 %21, label %10, label %13, !llvm.loop !7

22:                                               ; preds = %10
  call void @free(ptr noundef nonnull %4)
  call void @free(ptr noundef nonnull %5)
  br label %264

23:                                               ; preds = %10
  %24 = call i32 @clock() #7
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store volatile double 0.000000e+00, ptr %2, align 8
  %25 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %26 = load ptr, ptr %1, align 4
  %27 = load i32, ptr %25, align 4
  %28 = icmp ne ptr %26, null
  %29 = icmp sgt i32 %27, 1023
  %30 = select i1 %28, i1 %29, i1 false
  br i1 %30, label %31, label %124

31:                                               ; preds = %23
  %32 = getelementptr inbounds nuw i8, ptr %5, i32 8168
  %33 = getelementptr inbounds nuw i8, ptr %5, i32 8176
  %34 = getelementptr inbounds nuw i8, ptr %5, i32 8184
  br label %41

35:                                               ; preds = %99
  %36 = load ptr, ptr %1, align 4
  %37 = load i32, ptr %25, align 4
  %38 = icmp ne ptr %36, null
  %39 = icmp sgt i32 %37, 1023
  %40 = select i1 %38, i1 %39, i1 false
  br i1 %40, label %41, label %123, !llvm.loop !9

41:                                               ; preds = %31, %35
  %42 = phi ptr [ %36, %35 ], [ %26, %31 ]
  %43 = phi i32 [ %120, %35 ], [ 0, %31 ]
  store double 0.000000e+00, ptr %42, align 8
  br label %44

44:                                               ; preds = %44, %41
  %45 = phi double [ 0.000000e+00, %41 ], [ %64, %44 ]
  %46 = phi i32 [ 0, %41 ], [ %65, %44 ]
  %47 = getelementptr inbounds nuw double, ptr %4, i32 %46
  %48 = load double, ptr %47, align 8
  %49 = fadd double %45, %48
  %50 = or disjoint i32 %46, 1
  %51 = getelementptr inbounds nuw double, ptr %42, i32 %50
  store double %49, ptr %51, align 8
  %52 = getelementptr inbounds nuw double, ptr %4, i32 %50
  %53 = load double, ptr %52, align 8
  %54 = fadd double %49, %53
  %55 = or disjoint i32 %46, 2
  %56 = getelementptr inbounds nuw double, ptr %42, i32 %55
  store double %54, ptr %56, align 8
  %57 = getelementptr inbounds nuw double, ptr %4, i32 %55
  %58 = load double, ptr %57, align 8
  %59 = fadd double %54, %58
  %60 = or disjoint i32 %46, 3
  %61 = getelementptr inbounds nuw double, ptr %42, i32 %60
  store double %59, ptr %61, align 8
  %62 = getelementptr inbounds nuw double, ptr %4, i32 %60
  %63 = load double, ptr %62, align 8
  %64 = fadd double %59, %63
  %65 = add nuw nsw i32 %46, 4
  %66 = getelementptr inbounds nuw double, ptr %42, i32 %65
  store double %64, ptr %66, align 8
  %67 = icmp eq i32 %65, 1024
  br i1 %67, label %68, label %44, !llvm.loop !10

68:                                               ; preds = %44, %68
  %69 = phi i32 [ %97, %68 ], [ 0, %44 ]
  %70 = or disjoint i32 %69, 1
  %71 = getelementptr inbounds nuw double, ptr %42, i32 %70
  %72 = getelementptr inbounds nuw i8, ptr %71, i32 8
  %73 = load <4 x double>, ptr %72, align 8
  %74 = getelementptr i8, ptr %71, i32 -8
  %75 = load <4 x double>, ptr %74, align 8
  %76 = fsub <4 x double> %73, %75
  %77 = fmul <4 x double> %76, splat (double 5.000000e-01)
  %78 = getelementptr inbounds nuw double, ptr %5, i32 %70
  store <4 x double> %77, ptr %78, align 8
  %79 = add nuw nsw i32 %69, 5
  %80 = getelementptr inbounds nuw double, ptr %42, i32 %79
  %81 = getelementptr inbounds nuw i8, ptr %80, i32 8
  %82 = load <4 x double>, ptr %81, align 8
  %83 = getelementptr i8, ptr %80, i32 -8
  %84 = load <4 x double>, ptr %83, align 8
  %85 = fsub <4 x double> %82, %84
  %86 = fmul <4 x double> %85, splat (double 5.000000e-01)
  %87 = getelementptr inbounds nuw double, ptr %5, i32 %79
  store <4 x double> %86, ptr %87, align 8
  %88 = add nuw nsw i32 %69, 9
  %89 = getelementptr inbounds nuw double, ptr %42, i32 %88
  %90 = getelementptr inbounds nuw i8, ptr %89, i32 8
  %91 = load <4 x double>, ptr %90, align 8
  %92 = getelementptr i8, ptr %89, i32 -8
  %93 = load <4 x double>, ptr %92, align 8
  %94 = fsub <4 x double> %91, %93
  %95 = fmul <4 x double> %94, splat (double 5.000000e-01)
  %96 = getelementptr inbounds nuw double, ptr %5, i32 %88
  store <4 x double> %95, ptr %96, align 8
  %97 = add nuw nsw i32 %69, 12
  %98 = icmp eq i32 %97, 1020
  br i1 %98, label %99, label %68, !llvm.loop !11

99:                                               ; preds = %68
  %100 = getelementptr inbounds nuw i8, ptr %42, i32 8176
  %101 = load double, ptr %100, align 8
  %102 = getelementptr i8, ptr %42, i32 8160
  %103 = load double, ptr %102, align 8
  %104 = fsub double %101, %103
  %105 = fmul double %104, 5.000000e-01
  store double %105, ptr %32, align 8
  %106 = getelementptr inbounds nuw i8, ptr %42, i32 8184
  %107 = load double, ptr %106, align 8
  %108 = getelementptr i8, ptr %42, i32 8168
  %109 = load double, ptr %108, align 8
  %110 = fsub double %107, %109
  %111 = fmul double %110, 5.000000e-01
  store double %111, ptr %33, align 8
  %112 = getelementptr inbounds nuw i8, ptr %42, i32 8192
  %113 = load double, ptr %112, align 8
  %114 = getelementptr i8, ptr %42, i32 8176
  %115 = load double, ptr %114, align 8
  %116 = fsub double %113, %115
  %117 = fmul double %116, 5.000000e-01
  store double %117, ptr %34, align 8
  %118 = load volatile double, ptr %2, align 8
  %119 = fadd double %117, %118
  store volatile double %119, ptr %2, align 8
  %120 = add nuw nsw i32 %43, 1
  %121 = icmp eq i32 %120, 5000
  br i1 %121, label %122, label %35, !llvm.loop !9

122:                                              ; preds = %99
  store double 0x7FF8000000000000, ptr %5, align 8
  br label %124, !llvm.loop !9

123:                                              ; preds = %35
  store double 0x7FF8000000000000, ptr %5, align 8
  br label %124

124:                                              ; preds = %123, %122, %23
  %125 = phi i1 [ false, %23 ], [ true, %122 ], [ false, %123 ]
  %126 = phi double [ undef, %23 ], [ %117, %122 ], [ %117, %123 ]
  %127 = phi i32 [ -1, %23 ], [ 0, %122 ], [ -1, %123 ]
  %128 = call i32 @clock() #7
  call void @fast_moving_average_free(ptr noundef nonnull %1) #7
  br i1 %125, label %129, label %263

129:                                              ; preds = %124
  %130 = sub i32 %128, %24
  %131 = uitofp i32 %130 to double
  %132 = fdiv double %131, 1.000000e+03
  %133 = load volatile double, ptr %2, align 8
  %134 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0CH@NEAECOHK@repeats?$DN?$CFd?5elapsed?$DN?$CF?46f?5sec?5sink@", i32 noundef 5000, double noundef %132, double noundef %133)
  %135 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0N@JLHPNFCI@src?$CIhead8?$CJ?3?5?$AA@")
  %136 = load double, ptr %4, align 8
  %137 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_05FMONJPMD@?$CF?43f?5?$AA@", double noundef %136)
  %138 = getelementptr inbounds nuw i8, ptr %4, i32 8
  %139 = load double, ptr %138, align 8
  %140 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_05FMONJPMD@?$CF?43f?5?$AA@", double noundef %139)
  %141 = getelementptr inbounds nuw i8, ptr %4, i32 16
  %142 = load double, ptr %141, align 8
  %143 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_05FMONJPMD@?$CF?43f?5?$AA@", double noundef %142)
  %144 = getelementptr inbounds nuw i8, ptr %4, i32 24
  %145 = load double, ptr %144, align 8
  %146 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_05FMONJPMD@?$CF?43f?5?$AA@", double noundef %145)
  %147 = getelementptr inbounds nuw i8, ptr %4, i32 32
  %148 = load double, ptr %147, align 8
  %149 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_05FMONJPMD@?$CF?43f?5?$AA@", double noundef %148)
  %150 = getelementptr inbounds nuw i8, ptr %4, i32 40
  %151 = load double, ptr %150, align 8
  %152 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_05FMONJPMD@?$CF?43f?5?$AA@", double noundef %151)
  %153 = getelementptr inbounds nuw i8, ptr %4, i32 48
  %154 = load double, ptr %153, align 8
  %155 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_05FMONJPMD@?$CF?43f?5?$AA@", double noundef %154)
  %156 = getelementptr inbounds nuw i8, ptr %4, i32 56
  %157 = load double, ptr %156, align 8
  %158 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_05FMONJPMD@?$CF?43f?5?$AA@", double noundef %157)
  %159 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BB@HJPOOFAK@?4?4?4?5src?$CItail4?$CJ?3?5?$AA@")
  %160 = getelementptr inbounds nuw i8, ptr %4, i32 8160
  %161 = load double, ptr %160, align 8
  %162 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_05FMONJPMD@?$CF?43f?5?$AA@", double noundef %161)
  %163 = getelementptr inbounds nuw i8, ptr %4, i32 8168
  %164 = load double, ptr %163, align 8
  %165 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_05FMONJPMD@?$CF?43f?5?$AA@", double noundef %164)
  %166 = getelementptr inbounds nuw i8, ptr %4, i32 8176
  %167 = load double, ptr %166, align 8
  %168 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_05FMONJPMD@?$CF?43f?5?$AA@", double noundef %167)
  %169 = getelementptr inbounds nuw i8, ptr %4, i32 8184
  %170 = load double, ptr %169, align 8
  %171 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_05FMONJPMD@?$CF?43f?5?$AA@", double noundef %170)
  %172 = call i32 @putchar(i32 10)
  %173 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0O@BJBDEOHD@mavg?$CIhead8?$CJ?3?5?$AA@")
  %174 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_04LCAEPKME@NaN?5?$AA@")
  %175 = getelementptr inbounds nuw i8, ptr %5, i32 8
  %176 = load double, ptr %175, align 8
  %177 = fcmp ord double %176, 0.000000e+00
  br i1 %177, label %180, label %178

178:                                              ; preds = %129
  %179 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_04LCAEPKME@NaN?5?$AA@")
  br label %182

180:                                              ; preds = %129
  %181 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_05OEFBPIKG@?$CF?42f?5?$AA@", double noundef %176)
  br label %182

182:                                              ; preds = %180, %178
  %183 = getelementptr inbounds nuw i8, ptr %5, i32 16
  %184 = load double, ptr %183, align 8
  %185 = fcmp ord double %184, 0.000000e+00
  br i1 %185, label %188, label %186

186:                                              ; preds = %182
  %187 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_04LCAEPKME@NaN?5?$AA@")
  br label %190

188:                                              ; preds = %182
  %189 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_05OEFBPIKG@?$CF?42f?5?$AA@", double noundef %184)
  br label %190

190:                                              ; preds = %188, %186
  %191 = getelementptr inbounds nuw i8, ptr %5, i32 24
  %192 = load double, ptr %191, align 8
  %193 = fcmp ord double %192, 0.000000e+00
  br i1 %193, label %196, label %194

194:                                              ; preds = %190
  %195 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_04LCAEPKME@NaN?5?$AA@")
  br label %198

196:                                              ; preds = %190
  %197 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_05OEFBPIKG@?$CF?42f?5?$AA@", double noundef %192)
  br label %198

198:                                              ; preds = %196, %194
  %199 = getelementptr inbounds nuw i8, ptr %5, i32 32
  %200 = load double, ptr %199, align 8
  %201 = fcmp ord double %200, 0.000000e+00
  br i1 %201, label %204, label %202

202:                                              ; preds = %198
  %203 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_04LCAEPKME@NaN?5?$AA@")
  br label %206

204:                                              ; preds = %198
  %205 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_05OEFBPIKG@?$CF?42f?5?$AA@", double noundef %200)
  br label %206

206:                                              ; preds = %204, %202
  %207 = getelementptr inbounds nuw i8, ptr %5, i32 40
  %208 = load double, ptr %207, align 8
  %209 = fcmp ord double %208, 0.000000e+00
  br i1 %209, label %212, label %210

210:                                              ; preds = %206
  %211 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_04LCAEPKME@NaN?5?$AA@")
  br label %214

212:                                              ; preds = %206
  %213 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_05OEFBPIKG@?$CF?42f?5?$AA@", double noundef %208)
  br label %214

214:                                              ; preds = %212, %210
  %215 = getelementptr inbounds nuw i8, ptr %5, i32 48
  %216 = load double, ptr %215, align 8
  %217 = fcmp ord double %216, 0.000000e+00
  br i1 %217, label %220, label %218

218:                                              ; preds = %214
  %219 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_04LCAEPKME@NaN?5?$AA@")
  br label %222

220:                                              ; preds = %214
  %221 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_05OEFBPIKG@?$CF?42f?5?$AA@", double noundef %216)
  br label %222

222:                                              ; preds = %220, %218
  %223 = getelementptr inbounds nuw i8, ptr %5, i32 56
  %224 = load double, ptr %223, align 8
  %225 = fcmp ord double %224, 0.000000e+00
  br i1 %225, label %228, label %226

226:                                              ; preds = %222
  %227 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_04LCAEPKME@NaN?5?$AA@")
  br label %230

228:                                              ; preds = %222
  %229 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_05OEFBPIKG@?$CF?42f?5?$AA@", double noundef %224)
  br label %230

230:                                              ; preds = %228, %226
  %231 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_0BC@OPNFLFPA@?4?4?4?5mavg?$CItail4?$CJ?3?5?$AA@")
  %232 = getelementptr inbounds nuw i8, ptr %5, i32 8160
  %233 = load double, ptr %232, align 8
  %234 = fcmp ord double %233, 0.000000e+00
  br i1 %234, label %237, label %235

235:                                              ; preds = %230
  %236 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_04LCAEPKME@NaN?5?$AA@")
  br label %239

237:                                              ; preds = %230
  %238 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_05OEFBPIKG@?$CF?42f?5?$AA@", double noundef %233)
  br label %239

239:                                              ; preds = %235, %237
  %240 = getelementptr inbounds nuw i8, ptr %5, i32 8168
  %241 = load double, ptr %240, align 8
  %242 = fcmp ord double %241, 0.000000e+00
  br i1 %242, label %245, label %243

243:                                              ; preds = %239
  %244 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_04LCAEPKME@NaN?5?$AA@")
  br label %247

245:                                              ; preds = %239
  %246 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_05OEFBPIKG@?$CF?42f?5?$AA@", double noundef %241)
  br label %247

247:                                              ; preds = %245, %243
  %248 = getelementptr inbounds nuw i8, ptr %5, i32 8176
  %249 = load double, ptr %248, align 8
  %250 = fcmp ord double %249, 0.000000e+00
  br i1 %250, label %253, label %251

251:                                              ; preds = %247
  %252 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_04LCAEPKME@NaN?5?$AA@")
  br label %255

253:                                              ; preds = %247
  %254 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_05OEFBPIKG@?$CF?42f?5?$AA@", double noundef %249)
  br label %255

255:                                              ; preds = %253, %251
  %256 = fcmp ord double %126, 0.000000e+00
  br i1 %256, label %259, label %257

257:                                              ; preds = %255
  %258 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_04LCAEPKME@NaN?5?$AA@")
  br label %261

259:                                              ; preds = %255
  %260 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @"??_C@_05OEFBPIKG@?$CF?42f?5?$AA@", double noundef %126)
  br label %261

261:                                              ; preds = %259, %257
  %262 = call i32 @putchar(i32 10)
  br label %263

263:                                              ; preds = %261, %124
  call void @free(ptr noundef nonnull %4)
  call void @free(ptr noundef nonnull %5)
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  br label %264

264:                                              ; preds = %263, %22
  %265 = phi i32 [ %11, %22 ], [ %127, %263 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %1) #7
  br label %266

266:                                              ; preds = %264, %9
  %267 = phi i32 [ %265, %264 ], [ -1, %9 ]
  ret i32 %267
}

declare dso_local void @srand(i32 noundef) local_unnamed_addr #1

declare dso_local i32 @time(ptr noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare dso_local noalias noundef ptr @malloc(i32 noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare dso_local void @free(ptr allocptr noundef captures(none)) local_unnamed_addr #4

declare dso_local i32 @rand() local_unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

declare dso_local i32 @fast_moving_average_init(ptr noundef, i32 noundef) local_unnamed_addr #1

declare dso_local i32 @clock() local_unnamed_addr #1

declare dso_local void @fast_moving_average_free(ptr noundef) local_unnamed_addr #1

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #5

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr #6

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+avx,+avx2,+cmov,+crc32,+cx8,+fma,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave" "tune-cpu"="generic" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+avx,+avx2,+cmov,+crc32,+cx8,+fma,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave" "tune-cpu"="generic" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+avx,+avx2,+cmov,+crc32,+cx8,+fma,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave" "tune-cpu"="generic" }
attributes #4 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+avx,+avx2,+cmov,+crc32,+cx8,+fma,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave" "tune-cpu"="generic" }
attributes #5 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+avx,+avx2,+cmov,+crc32,+cx8,+fma,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave" "tune-cpu"="generic" }
attributes #6 = { nofree nounwind }
attributes #7 = { nounwind }
attributes #8 = { allocsize(0) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "main.c", directory: "D:\\work\\rtacc\\examples\\movingave")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 2}
!5 = !{i32 1, !"MaxTLSAlign", i32 65536}
!6 = !{!"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = distinct !{!9, !8}
!10 = distinct !{!10, !8}
!11 = distinct !{!11, !8, !12, !13, !14}
!12 = !{!"llvm.loop.peeled.count", i32 1}
!13 = !{!"llvm.loop.isvectorized", i32 1}
!14 = !{!"llvm.loop.unroll.runtime.disable"}
