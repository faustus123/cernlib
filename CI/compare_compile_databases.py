
#This script is designed to analyse the compilation databases created with cmake and imake build systems.
# The databases are created running build script with bear or bear3
#    sh CI/build.sh cmake tarball GNU bear3
#    sh CI/build.sh imake tarball GNU bear3
import json,re,sys,os
def get_compilation_DB(fname):
 f = open(fname)
 data = json.load(f)
 L = {}
 for i in data:
  ar = i['arguments']
  fil = i['file']
  fil = fil.replace("../../../../","")
  fil = fil.replace("../../../","")
  fil = fil.replace("../../","")
  fil = fil.replace("../","")
  fil = fil.replace("../../../../src/","")
  fil = fil.replace("../../../../2022/src/","")
  fil = fil.replace("../../../2022/src/","")
  fil = fil.replace("../../2022/src/","")
  fil = fil.replace("../2022/src/","")
  fil = fil.replace("../mclibs","mclibs")    
  fil = fil.replace("../graflib","graflib")
  fil = fil.replace("../geant321","geant321")        
  fil = fil.replace("2022/src/","") 
  current_directory = os.getcwd()
  comp = ar[0]
  comparg = ar[1:]
  comparg = [ x.replace(current_directory+"/rpmbuild/BUILD/cernlib-2022/2022/src","") for x in comparg]
  comparg = [ x.replace(current_directory+"/rpmbuild/BUILD/cernlib-2022/2022/build","") for x in comparg]
  comparg = [ x.replace(current_directory+"/TEMP/2022/src","") for x in comparg]
  comparg = [ x.replace(current_directory+"/build","") for x in comparg]
  comparg = [ x.replace(current_directory+"rpmbuild/BUILD/cernlib-2022/2022/src","") for x in comparg]
  comparg = [ x.replace(current_directory+"rpmbuild/BUILD/cernlib-2022/2022/build","") for x in comparg]
  comparg = [ x.replace(current_directory+"TEMP/2022/src","") for x in comparg]
  comparg = [ x.replace(current_directory+"build","") for x in comparg]
  comparg = [ x.replace(current_directory+"","") for x in comparg]
  comparg = [ x for x in comparg if not re.match(r'^-I/usr/include$',x)]
  comparg = [ x for x in comparg if x.startswith('-')]
  comparg = list( dict.fromkeys(comparg) )
  comparg.sort()
  if not re.match(r'.*lapack.*',i['directory']) :
   L[fil] = comparg
 f.close()
 return L

def get_list_difference(li1, li2):
  return list(set(li1) - set(li2)) + list(set(li2) - set(li1))

def get_list(dict):
  list = []
  for key in dict.keys():
    list.append(key)
  return list

cmakeDB = get_compilation_DB("cmakeGNU.json")
imakeDB = get_compilation_DB("imakeGNU.json")

cmakeList = get_list(cmakeDB)
cmakeList.sort()

imakeList = get_list(imakeDB)
imakeList.sort()


differenceList = get_list_difference(imakeList,cmakeList)

#Bear does not catch some complex cases in imake or cmake builds just more tests
differenceList = [ x for x in differenceList if not re.match(r'.*kernbit/test.*',x)]  
differenceList = [ x for x in differenceList if not re.match(r'.*kerngen/test.*',x)]  
differenceList = [ x for x in differenceList if not re.match(r'.*kernnum/test.*',x)]  
differenceList = [ x for x in differenceList if not re.match(r'.*tests/ptest1.*',x)]  
differenceList = [ x for x in differenceList if not re.match(r'.*comis/test.*',x)]  
differenceList = [ x for x in differenceList if not re.match(r'.*isajet/test.*',x)]  
differenceList = [ x for x in differenceList if not re.match(r'.*mclibs/.*test.*',x)]  
differenceList = [ x for x in differenceList if not re.match(r'.*/test/.*',x)]  
differenceList = [ x for x in differenceList if not re.match(r'.*/wicoexam/.*',x)]  
differenceList = [ x for x in differenceList if not re.match(r'.*kuip/examples.*',x)]  
differenceList = [ x for x in differenceList if not re.match(r'.*minuit/examples.*',x)]  
differenceList = [ x for x in differenceList if not re.match(r'.*bvsl/test.*',x)]  
differenceList = [ x for x in differenceList if not re.match(r'.*gen/tests.*',x)]  
#differenceList = [ x for x in differenceList if not re.match(r'.*test.*',x)]  
differenceList = [ x for x in differenceList if not re.match(r'.*erexam.*',x)] 
differenceList = [ x for x in differenceList if not re.match(r'.*gexam.*',x)] 
#differenceList = [ x for x in differenceList if not re.match(r'.*example.*',x)]  
differenceList = [ x for x in differenceList if not re.match(r'.*patchy5.*',x)]  
#differenceList = [ x for x in differenceList if not re.match(r'.*patchy4.*',x)]  
differenceList = [ x for x in differenceList if not re.match(r'.*cdf.*',x)]  
#differenceList = [ x for x in differenceList if not re.match(r'.*/dz.*',x)] 
differenceList = [ x for x in differenceList if not re.match(r'.*paw_motif/xbae.*',x)] 


filteredCmakeList = cmakeList
filteredCmakeList = [ x for x in filteredCmakeList if not re.match(r'.*kernbit/test.*',x)]  
filteredCmakeList = [ x for x in filteredCmakeList if not re.match(r'.*kerngen/test.*',x)]  
filteredCmakeList = [ x for x in filteredCmakeList if not re.match(r'.*kernnum/test.*',x)]  
filteredCmakeList = [ x for x in filteredCmakeList if not re.match(r'.*tests/ptest1.*',x)]  
filteredCmakeList = [ x for x in filteredCmakeList if not re.match(r'.*comis/test.*',x)]  
filteredCmakeList = [ x for x in filteredCmakeList if not re.match(r'.*isajet/test.*',x)]  
filteredCmakeList = [ x for x in filteredCmakeList if not re.match(r'.*mclibs/.*test.*',x)]  
filteredCmakeList = [ x for x in filteredCmakeList if not re.match(r'.*/test/.*',x)]  
filteredCmakeList = [ x for x in filteredCmakeList if not re.match(r'.*/wicoexam/.*',x)]  
filteredCmakeList = [ x for x in filteredCmakeList if not re.match(r'.*kuip/examples.*',x)]  
filteredCmakeList = [ x for x in filteredCmakeList if not re.match(r'.*minuit/examples.*',x)]  
filteredCmakeList = [ x for x in filteredCmakeList if not re.match(r'.*gen/tests.*',x)]  
filteredCmakeList = [ x for x in filteredCmakeList if not re.match(r'.*bvsl/test.*',x)]  
#filteredCmakeList = [ x for x in filteredCmakeList if not re.match(r'.*test.*',x)]  
filteredCmakeList = [ x for x in filteredCmakeList if not re.match(r'.*erexam.*',x)]  
filteredCmakeList = [ x for x in filteredCmakeList if not re.match(r'.*gexam.*',x)]  
#filteredCmakeList = [ x for x in filteredCmakeList if not re.match(r'.*example.*',x)]  
filteredCmakeList = [ x for x in filteredCmakeList if not re.match(r'.*patchy5.*',x)]  
#filteredCmakeList = [ x for x in filteredCmakeList if not re.match(r'.*patchy4.*',x)]  
filteredCmakeList = [ x for x in filteredCmakeList if not re.match(r'.*cdf.*',x)]  
#filteredCmakeList = [ x for x in filteredCmakeList if not re.match(r'.*/dz.*',x)] 
filteredCmakeList = [ x for x in filteredCmakeList if not re.match(r'.*paw_motif/xbae.*',x)] 



#Print results per package

#Libraries
packages= ["packlib","kernlib","mathlib","graflib/higz","graflib","phtools","pawlib","geant321","paw_motif","mclibs/ariadne","mclibs/cojets","mclibs/eurodec","mclibs/fritiof","mclibs/herwig","mclibs/isajet","mclibs/jetset","mclibs/lepto63","mclibs/pdf","mclibs/photos", "mclibs/pythia","code_motif"]
#mclibs/herwig58) 
#mclibs/ariadne_407)

#Executables
packages= ["packlib/kuip/programs/kuipc/","packlib/hepdb/programs/hepdb/","packlib/hepdb/programs/cdmake/","packlib/hepdb/programs/cdmove/","packlib/kuip/programs/kuesvr/","packlib/kuip/programs/kxterm/","packlib/hepdb/programs/cdbackup/","packlib/hepdb/programs/cdserv/","graflib/dzdoc/dzedit/","pawlib/paw/programs/","packlib/cspack/programs/zftp/","packlib/fatmen/programs/fatback/","packlib/cspack/programs/zs/","packlib/fatmen/programs/fatnew/","packlib/fatmen/programs/fmkuip/","packlib/fatmen/programs/fatsend/","packlib/fatmen/programs/fatsrv/","patchy4/p4lib/","patchy5/p5boot/p5lib/"]

#Everything
packages =["allfiles"]

comdefines ={}

for pack in packages:
 allDefinescmake=set()

 allDefinesimake=set()
 allWDefinescmake=set()

 allWDefinesimake=set()
 DiffDefines=[]
 for a in filteredCmakeList:
  if (re.match(r'%s'%pack,a) and a != "graflib") or (re.match(r'graflib',a) and not re.match(r'graflib/higz',a)  ) or ( pack == "allfiles" ):
    compileOptions = get_list_difference(cmakeDB[a],imakeDB[a])
    Includes = [ x for x in compileOptions if re.match(r'^-I.*',x)]  
    compileOptions = [ x for x in compileOptions if not re.match(r'^-I.*',x)]  
    Definescmake = [ x for x in cmakeDB[a] if re.match(r'^-D.*',x)]  
    Definesimake = [ x for x in imakeDB[a] if re.match(r'^-D.*',x)]  
    comdefines[pack] = Definesimake
    Definescmake.sort()
    Definesimake.sort()
    DiffDefines=get_list_difference(Definesimake,Definescmake)
    #Filter some known differences
    DiffDefines=[ x for x in DiffDefines if not re.match(r'^-DFUNCPROTO.*',x)]  

    allDefinesimake.update(Definesimake)
    allDefinescmake.update(Definescmake)

    WDefinescmake = [ x for x in cmakeDB[a] if re.match(r'^-W.*',x)]  
    WDefinesimake = [ x for x in imakeDB[a] if re.match(r'^-W.*',x)]  
    allWDefinesimake.update(WDefinesimake)
    allWDefinescmake.update(WDefinescmake)

    #Filter non-flags and known differences
    compileOptions = [ x for x in compileOptions if not re.match(r'^-D.*',x)]  
    compileOptions = [ x for x in compileOptions if not re.match(r'^-Wno-.*',x)]  
    compileOptions = [ x for x in compileOptions if not re.match(r'^-no-pie.*',x)]  
    compileOptions = [ x for x in compileOptions if not re.match(r'^-pipe.*',x)]  
    if (len(compileOptions)>0 or len(DiffDefines)>0):
     print("Note file ",a)
     print("Defines: diff, cmake, imake")
     print(DiffDefines)
     print(Definescmake)
     print(Definesimake)
     print("Compile options: diff")
     print(compileOptions)
 allDiffDefines=get_list_difference(list(allDefinescmake),list(allDefinesimake))
 allDiffDefines=[ x for x in allDiffDefines if not re.match(r'^-DFUNCPROTO.*',x)]

 print(pack)
 if len(allDiffDefines)>0:
  print(allDiffDefines)
  cm=list(allDefinescmake)
  cm.sort()
  print(cm)
  im=list(allDefinesimake)
  im.sort()
  print(im)


 Wcm=list(allWDefinescmake)
 Wcm.sort()
 #print(Wcm)
 Wim=list(allWDefinesimake)
 Wim.sort()
 #print(Wim)

alld = set()
comm = set()
for x in comdefines.keys(): alld.update(comdefines[x])

comm = alld 
print("All defines")
print (comm)
for x in comdefines.keys():
    comm= comm.intersection(comdefines[x])
print("Common defines")
print (comm)

