import sys
import os
import re
########################################################################
def get_suffixes(text):
    if (text=="xbae"):
      return ["_static"]
    return ["_static", ""]
def if_install_library(text):
    if (text=="xbae"):
      return False
    return True
def link_static(text):
    if (text=="pythia"):
        return "pythia"
    if (text=="geant321"):
        return "geant"
    if (text=="herwig"):
        return "herwig"
    if (text=="kernlib"):
        return "kernlib-${SHIFTSUFFIX}"
    if (text=="packlib"):
        return "packlib-${SHIFTSUFFIX}"
    return "no"
def output_name_static(text):
    if (text=="pythia"):
        return "pythia6205"
    if (text=="higz"):
        return "grafX11"
    if (text=="code_motif"):
        return "packlib-lesstif"
    if (text=="paw_motif"):
        return "pawlib-lesstif"
    if (text=="herwig"):
        return "herwig59"
    if (text=="photos"):
        return "photos202"
    if (text=="pdf"):
        return "pdflib804"
    if (text=="isajet"):
        return "isajet758"
    if (text=="jetset"):
        return "jetset74"
    if (text=="lepto63"):
        return "lepto651"
    return text
########################################################################    
def output_name(text):
    if (text=="pythia"):
        return "pythia6205"
    if (text=="higz"):
        return "grafX11"
    if (text=="code_motif"):
        return "packlib-lesstif"
    if (text=="paw_motif"):
        return "pawlib-lesstif"
    if (text=="herwig"):
        return "herwig59"
    if (text=="photos"):
        return "photos202"
    if (text=="pdf"):
        return "pdflib804"
    if (text=="isajet"):
        return "isajet758"
    if (text=="jetset"):
        return "jetset74" 
    if (text=="lepto63"):
        return "lepto651"               
    return text
########################################################################    
def get_simple_so_version(text):
    if (text=="jetset"):
        return "3_${COMPSUFFIX}"
    if (text=="fritiof"):
        return "1_${COMPSUFFIX}"
    if (text=="ariadne"):
        return "1_${COMPSUFFIX}"
    if (text=="higz"):
        return "1_${COMPSUFFIX}"
    if (text=="code_motif"):
        return "1_${COMPSUFFIX}"
    if (text=="paw_motif"):
        return "3_${COMPSUFFIX}"
    if (text=="eurodec"):
        return "1_${COMPSUFFIX}"
    if (text=="graflib"):
        return "1_${COMPSUFFIX}"
    if (text=="kernlib"):
        return "1_${COMPSUFFIX}"
    if (text=="packlib"):
        return "1_${COMPSUFFIX}"
    if (text=="photos"):
        return "1_${COMPSUFFIX}"
    if (text=="isajet"):
        return "3_${COMPSUFFIX}"        
    if (text=="pythia"):
        return "3_${COMPSUFFIX}"  
    if (text=="lepto63"):
        return "3_${COMPSUFFIX}"
    return "2_${COMPSUFFIX}"
########################################################################
def get_full_so_version(text):
     return get_simple_so_version(text)+".${CERNLIB_VERSION_MAJOR}"
########################################################################
def comment_remover(text):
    def replacer(match):
        s = match.group(0)
        if s.startswith('/'):
            return " " # note: a space and not an empty string
        else:
            return s
    pattern = re.compile(r'//.*?$|/\*.*?\*/|\'(?:\\.|[^\\\'])*\'|"(?:\\.|[^\\"])*"',re.DOTALL | re.MULTILINE)
    return re.sub(pattern, replacer, text)
########################################################################
def write_header(f,ldirs):
   f.write("""
########################################################################
#
#  Automatically or semiautomaticall generated, do not edit.
#
########################################################################
# The following input was used
""")
   for a in ldirs:
     f.write("# "+a +"\n")
   f.write("""
########################################################################
""")
########################################################################
def get_if_condition(a):
  if len(a)>0:
    if re.match(r'.*packlib_cspack_sysreq_.*',a):
      return [
"""
#Inserted by get_if_condition()->
if ( (CERNLIB_VAXVMS OR CERNLIB_UNIX)  AND  ( (NOT CERNLIB_SHIFT) AND ( NOT CERNLIB_WINNT) ) )
""",
"""
else()
  set(packlib_cspack_sysreq_CSRC )
endif()
#Inserted by get_if_condition()<-
"""]
  return ["",""]
########################################################################
def transform_pilots(argv):
    path_to_file=argv
    file_contents=''
    with open(path_to_file) as f:
      file_contents = f.readlines()
    newlist =file_contents
    newlist = [x.replace("\t"," ") for x in newlist]
    newlist = [x.replace("    "," ") for x in newlist]
    newlist = [x.replace("   "," ") for x in newlist]
    newlist = [x.replace("  "," ") for x in newlist]
    newlist = [x.replace("# ","#") for x in newlist]
    newlist = [x.replace("# ","#") for x in newlist]
    newlist = [x.strip() for x in newlist]
    newlist = filter(lambda st: st != '' , newlist)
    #newlist = [  "\n"+x.replace("#define ","set(")+"1)\n  add_definitions(-D"+x.replace("#define ","")+")\n"  if re.match(r'^#define .*',x)  else x for x in newlist]
    newlist = [  "\n"+x.replace("#define ","set(")+" 1)\n"  if re.match(r'^#define .*',x)  else x for x in newlist]
    newlist = [  x.replace("#ifndef ","if ( NOT (")+") )\n" if re.match(r'^#ifndef .*',x)  else x for x in newlist]
    newlist = [  x.replace("#ifdef ","if ( (")+") )\n" if re.match(r'^#ifdef .*',x)  else x for x in newlist]
    newlist = [  x.replace("#endif","endif()") if re.match(r'^#endif.*',x)  else x for x in newlist]
    newlist = [  x.replace("&&"," AND ")  for x in newlist]
    newlist = [  x.replace("||"," OR ")  for x in newlist]

    newlist = [x.strip() for x in newlist]
    #newlist = filter(lambda st: st != '' , newlist)
    newlist = [x.replace("set(","  set(") if not re.match(r'^  .*',x)  else x for x in newlist]
    newlist = [  x.replace("#if","if (")+" )" if re.match(r'^#if.*',x)  else x for x in newlist]
    newlist = [  x.replace("!defined","NOT defined") for x in newlist]
    newlist = [  x.replace("*-","#") for x in newlist]
    newlist = [  x.replace("NOT defined(","(NOT") for x in newlist]
    newlist = [  x.replace("defined(","(") for x in newlist]
    
    
    #for ai in file_contents:
    #   print(ai)
    #for ai in newlist:
    #   print(ai)
    return newlist


def transform_imake_source(argv, dbg):
    path_to_file=argv
    with open(path_to_file) as f:
      file_contents = f.readlines()
    my_lst_str = ''.join(file_contents)
    x=comment_remover(my_lst_str)

    filtered = x.split('\n')
    filtered= filter(lambda st: st != '\n' , filtered)
    filtered= filter(lambda st: st != '' , filtered)
    filtered= filter(lambda st: st != ' ' , filtered)
    filtered= filter(lambda st: not re.match(".*MotifDependantMakeVar.*",st), filtered)
    filtered= filter(lambda st: not re.match(".*SubdirLibraryTarget.*",st), filtered)
    filtered= filter(lambda st: not re.match(".*CernlibCcProgramTarget.*",st), filtered)
    filtered= filter(lambda st: not re.match(".*TopOfPackage.*",st), filtered)
    filtered= filter(lambda st: not re.match(".*NormalFortranProgramTarget.*",st), filtered)
    filtered= filter(lambda st: not re.match("^NormalProgramTarget.*",st), filtered)
    filtered= filter(lambda st: not re.match("^InstallNonExecFileTarget.*",st), filtered)    
    filtered= filter(lambda st: not re.match("^InstallSharedLibrary.*",st), filtered)
    filtered= filter(lambda st: not re.match("^InstallLibrary.*",st), filtered)
    filtered= filter(lambda st: not re.match("^AllTarget.*",st), filtered)
    filtered= filter(lambda st: not re.match("^TestTarget.*",st), filtered)
    filtered= filter(lambda st: not re.match("^DoIncludePackage.*",st), filtered)
    filtered= filter(lambda st: not re.match("^SubdirLibraryTarget.*",st), filtered)    
    filtered= filter(lambda st: not re.match(".*LinkFileFromDir.*",st), filtered)
    filtered= filter(lambda st: not re.match(".*FortranCmd.*",st), filtered)
    filtered= filter(lambda st: not re.match(".*VMS_OPT_FILES.*",st), filtered)
    filtered= filter(lambda st: not re.match(".*IMAKE_INCLUDES.*",st), filtered)
    filtered= filter(lambda st: not re.match(".*CERNDEFINES.*",st), filtered)
    filtered= filter(lambda st: not re.match(".*CLIBS.*",st), filtered)
    filtered= filter(lambda st: not re.match(".*nstallProgram.*",st), filtered)
    filtered= filter(lambda st: not re.match(".*eedTcpipLib.*",st), filtered)
    filtered= filter(lambda st: not re.match(".*NeedSysexe.*",st), filtered)
    #filtered= filter(lambda st: not re.match(".*CCOPTIONS.*",st), filtered)
    filtered= filter(lambda st: not re.match(".*\+Z \+DA1.*",st), filtered)
    filtered= filter(lambda st: not re.match("^gxint321.*",st), filtered)
    filtered= filter(lambda st: not re.match(".*cd \$\(.*",st), filtered)
    filtered= filter(lambda st: not re.match(".*gxint\.f.*",st), filtered)
    filtered= filter(lambda st: not re.match("^FC=mpxlf.*",st), filtered)
    filtered= filter(lambda st: not re.match(".*install\.lib.*",st), filtered)
    filtered= filter(lambda st: not re.match(".*clean::.*",st), filtered)
    filtered= filter(lambda st: not re.match(".*Makefile::.*",st), filtered)
    ###filtered= filter(lambda st: not re.match(".*LibraryTargetName.*",st), filtered)
    filtered= filter(lambda st: not re.match(".*RemoveFile.*",st), filtered)
    filtered= filter(lambda st: not re.match(".*CopyFile.*",st), filtered)
    filtered= filter(lambda st: not re.match(".*geant321_parallel.*",st), filtered)
    ###filtered= filter(lambda st: not re.match(".*CppFileTarget.*",st), filtered)
    #filtered= filter(lambda st: not re.match("^Install.*",st), filtered)
    #filtered= filter(lambda st: not re.match("^EXTRA_.*",st), filtered)
    #filtered= filter(lambda st: not re.match("^#include.*",st), filtered)
    filtered= filter(lambda st: not re.match("^IMAKE_DEFINES.*",st), filtered)
    filtered= filter(lambda st: not re.match("^[:blank:]*FORTRANSAVEOPTION.*",st), filtered)
    filtered= filter(lambda st: not re.match("^[:blank:]*FORTRAN.*",st), filtered)
    filtered= filter(lambda st: not re.match("^[:blank:]FORTRAN.*",st), filtered)
    filtered= filter(lambda st: not re.match("^FORTRANOPTIONS.*",st), filtered)
    filtered= filter(lambda st: not re.match("^SpecialFortranLibObjectRule.*",st), filtered)
    filtered= filter(lambda st: not re.match("^SpecialFortranObjectRule.*",st), filtered)
    filtered= filter(lambda st: not re.match("^[:blank:]*SpecialFortranObjectRule.*",st), filtered)
    filtered= filter(lambda st: not re.match("^[:blank:]*DefinePackage.*",st), filtered)
    filtered= filter(lambda st: not re.match("^[:blank:]*INCLUDES.*",st), filtered)
    filtered= filter(lambda st: not re.match("^[:blank:]*CernlibFortran.*",st), filtered)
    filtered= filter(lambda st: not re.match("^[:blank:]*PACKAGE.*",st), filtered)
    filtered= filter(lambda st: not re.match("^[:blank:]*FDEBUGFLAGS.*",st), filtered)
    filtered= filter(lambda st: not re.match("^[:blank:]*EXTRA_DEFINES.*",st), filtered)
    filtered= filter(lambda st: not re.match("^[:blank:]*CDEBUGFLAGS.*",st), filtered)
    filtered= filter(lambda st: not re.match("^#define.*",st), filtered)

    filtered = [x.replace(" : ",": ") for x in filtered]
    filtered = [x.replace("\t"," ") for x in filtered]
    filtered = [x.replace("="," = ") for x in filtered]
    filtered = [x.replace("\\ @@\\","") for x in filtered]
    filtered = [x.replace("\\@@\\","") for x in filtered]
    filtered = [x.replace("        "," ") for x in filtered]
    filtered = [x.replace("      "," ") for x in filtered]
    filtered = [x.replace("    "," ") for x in filtered]
    filtered = [x.replace("  "," ") for x in filtered]
    filtered = [x.replace("  \n","\n") for x in filtered]
    filtered = [x.replace("  \n","\n") for x in filtered]
    filtered = [x.replace("  \n","\n") for x in filtered]
    filtered = [x.replace("  \n","\n") for x in filtered]
    filtered = [x.replace("  \n","\n") for x in filtered]
    filtered = [x.replace("  "," ") for x in filtered]
    filtered = [x.strip(' ') for x in filtered]
    
    newlist=[]
    temp=''
    for a in filtered:

     if re.match("^#.*",a):
        newlist.append(temp)
        newlist.append(a)
        temp=''
     else:
      if re.match("^SRC.*",a):
        newlist.append(temp)
        temp=a
      else:
        temp+=' '
        temp+=a
     
     LISTNAME=path_to_file.replace("//","/").replace("/","_")
     LISTNAME=LISTNAME.replace("_Imakefile","")
     LISTNAME=LISTNAME.replace(".","0")#OH!
     
    incfiles = [ x  for x in newlist if re.match(r'#include.*',x)]
    incfiles =  [ x.replace("#include","") for x in incfiles]
    incfiles =  [ x.replace("\"","") for x in incfiles]
    incfiles =  [ x.replace(" ","") for x in incfiles]
    newlist.append(temp)
    newlist = filter(lambda st: st != '' , newlist)
    newlist = [ ("#"+x) if re.match(r'^[:blank:]*[^#]*CppTarget.*',x) else x for x in newlist]
    newlist = [ ("#"+x) if re.match(r'^[:blank:]*[^#]*FDEBUGFLAGS.*',x) else x for x in newlist]
    newlist = [ ("#"+x) if re.match(r'^[:blank:]*[^#]*CDEBUGFLAGS.*',x) else x for x in newlist]
    newlist = [ ("#"+x) if re.match(r'^[:blank:]*[^#]*CernLibFort.*',x) else x for x in newlist]

    newlist = [x.replace("(PACKAGE_LIB)","{PACKAGE_LIB}") for x in newlist]
    newlist = [x.replace("MOTIF_","") for x in newlist]
    newlist = [x.replace(" : =",": =") for x in newlist]
    newlist = [x.replace("_F+","_F +") for x in newlist]
    newlist = [x.replace("_C+","_C +") for x in newlist]
    #newlist = [ ("#ORIGINAL "+x+"\n"+"\n"+x) if re.match(r'.*defined.*',x) else x for x in newlist]
    l=[]
    for x in newlist:
      if re.match(r'.*defined.*',x):
        l.append("#ORIGINAL "+x)
      l.append(x)

    newlist=l    
    newlist = [x if re.match(r'^#ORIGINAL .*$',x) else x.replace("! defined(","!defined(") for x in newlist]
    newlist = [x if re.match(r'^#ORIGINAL .*$',x) else x.replace("#if (defined(CERNLIB_LINUX) && (!defined(CERNLIB_GFORTRAN)))","if (CERNLIB_LINUX AND NOT CERNLIB_GFORTRAN)") for x in newlist]
    newlist = [x if re.match(r'^#ORIGINAL .*$',x) else x.replace("#if defined(CERNLIB_DECS) || (defined(CERNLIB_LINUX) && !defined(CERNLIB_PPC)) || defined(CERNLIB_WINNT)","if (CERNLIB_DECS OR (CERNLIB_LINUX AND NOT CERNLIB_PPC) OR CERNLIB_WINNT)") for x in newlist]
    newlist = [x if re.match(r'^#ORIGINAL .*$',x) else x.replace("#if (!defined(CERNLIB_ASSEMB) && defined(CERNLIB_OLD))","if ( NOT CERNLIB_ASSEMB AND CERNLIB_OLD)") for x in newlist]
    newlist = [x if re.match(r'^#ORIGINAL .*$',x) else x.replace("#if (!defined(CERNLIB_NTC)) && (!defined(CERNLIB_X11))","if (NOT CERNLIB_NTC AND NOT CERNLIB_X11)") for x in newlist]
    newlist = [x if re.match(r'^#ORIGINAL .*$',x) else x.replace("#if !defined(","if (NOT ") for x in newlist]
    newlist = [x if re.match(r'^#ORIGINAL .*$',x) else x.replace("F_ARCHITECTURE = ","set(F_ARCHITECTURE ") for x in newlist]
    newlist = [x if re.match(r'^#ORIGINAL .*$',x) else x.replace("(F_ARCHITECTURE)","{F_ARCHITECTURE}  ") for x in newlist]
    newlist = [x if re.match(r'^#ORIGINAL .*$',x) else x.replace("#else","else()") for x in newlist]
    newlist = [x if re.match(r'^#ORIGINAL .*$',x) else x.replace("#if defined","if ") for x in newlist]
    newlist = [x if re.match(r'^#ORIGINAL .*$',x) else x.replace("#ifdef ","if (") for x in newlist]
    newlist = [x if re.match(r'^#ORIGINAL .*$',x) else x.replace("#ifndef ","if (NOT ") for x in newlist]
    newlist = [x if re.match(r'^#ORIGINAL .*$',x) else x.replace("#endif","endif()") for x in newlist]
    newlist = [x if re.match(r'^#ORIGINAL .*$',x) else x.replace("#endif","endif()") for x in newlist]
    newlist = [x if re.match(r'^#ORIGINAL .*$',x) else x.replace(") || defined("," OR ") for x in newlist]
    newlist = [x if re.match(r'^#ORIGINAL .*$',x) else x.replace(") && !defined("," AND NOT ") for x in newlist]
    newlist = [x if re.match(r'^#ORIGINAL .*$',x) else x.replace(") && defined("," AND ") for x in newlist]
    newlist = [x if re.match(r'^#ORIGINAL .*$',x) else x.replace(") && defined("," AND ") for x in newlist]
    newlist = [x if re.match(r'^#ORIGINAL .*$',x) else x.replace(") && (!defined(CERNLIB_PHIGS)) && (!defined(CERNLIB_MSDOS)"," AND NOT CERNLIB_PHIGS AND NOT CERNLIB_MSDOS") for x in newlist] 
    newlist = [x if re.match(r'^#ORIGINAL .*$',x) else x.replace("(CERNLIB_UNIX) && (!defined(CERNLIB_WINNT))","(CERNLIB_UNIX AND NOT CERNLIB_WINNT)") for x in newlist]
    newlist = [x if re.match(r'^#ORIGINAL .*$',x) else x.replace("if (CERNLIB_SHL) && ( defined(CERNLIB_SUN OR CERNLIB_SGI OR CERNLIB_IBMRT OR CERNLIB_QMVAOS OR CERNLIB_LINUX) )","if (CERNLIB_SHL AND ( CERNLIB_SUN OR CERNLIB_SGI OR CERNLIB_IBMRT OR CERNLIB_QMVAOS OR CERNLIB_LINUX) )") for x in newlist]
    newlist = [x if re.match(r'^#ORIGINAL .*$',x) else x.replace("CERNLIB_LNX AND NOT CERNLIB_QMLXIA64) && (!defined(CERNLIB_GFORTRAN)"," CERNLIB_LNX AND NOT CERNLIB_QMLXIA64 AND NOT CERNLIB_GFORTRAN") for x in newlist]
    newlist = [x.replace("SRCS_CDF =","  set("+LISTNAME+"_CDFSRC") for x in newlist]
    newlist = [x.replace("SRCS_CDF: = $(SRCS_CDF)","  list(APPEND "+LISTNAME+"_CDFSRC ") for x in newlist]
    newlist = [x.replace("SRCS_C =","  set("+LISTNAME+"_CSRC") for x in newlist]
    newlist = [x.replace("SRCS_C: = $(SRCS_C)","  list(APPEND "+LISTNAME+"_CSRC ") for x in newlist]
    newlist = [x.replace("SRCS_C + = ","  list(APPEND "+LISTNAME+"_CSRC ") for x in newlist]
    newlist = [x.replace("SRCS_F =","  set("+LISTNAME+"_FSRC") for x in newlist]
    newlist = [x.replace("SRCS_F: = $(SRCS_F)","  list(APPEND "+LISTNAME+"_FSRC ") for x in newlist]
    newlist = [x.replace("SRCS_F + = ","  list(APPEND "+LISTNAME+"_FSRC ") for x in newlist]
    newlist = [x.replace("SRCS_S =","  set("+LISTNAME+"_SSRC") for x in newlist]
    newlist = [x.replace("SRCS_S: = $(SRCS_S)","  list(APPEND "+LISTNAME+"_SSRC ") for x in newlist]
    newlist = [ ("#"+x) if re.match(r'^[:blank:]*[^#]*EXTRA_DEFINES.*',x) else x for x in newlist]
    newlist = [ ("#"+x) if re.match(r'^[:blank:]*[^#]*EXTRA_INCLUDES.*',x) else x for x in newlist]
    newlist = [ ("#"+x) if re.match(r'^[:blank:]*[^#]*EXTRA_LDOPTIONS.*',x) else x for x in newlist]
    newlist = [ ("#"+x) if re.match(r'^[:blank:]*[^#]*test:.*',x) else x for x in newlist]
    newlist = [ ("#"+x) if re.match(r'^[:blank:]*[^#]*CCOPTIONS.*',x) else x for x in newlist]
    newlist = [ ("#"+x) if re.match(r'^[:blank:]*[^#]*CERNDEFINES: =.*',x) else x for x in newlist]    
    newlist = [ ("#"+x) if re.match(r'^[:blank:]*[^#]*DEFINES: =.*',x) else x for x in newlist]
    newlist = [ ("#"+x) if re.match(r'^[:blank:]*[^#]*SpecialCObjectRule.*',x) else x for x in newlist]
    newlist = [ ("#"+x) if re.match(r'^[:blank:]*[^#]*CCOPTIONS + =.*',x) else x for x in newlist]    
    newlist = [ ("#"+x) if re.match(r'^[:blank:]*[^#]*FCLDOPTIONS.*',x) else x for x in newlist]
    newlist = [ ("#"+x) if re.match(r'^[:blank:]*[^#]*InstallProgram.*',x) else x for x in newlist]
    newlist = [ ("#"+x) if re.match(r'^[:blank:]*[^#]*InstallScr.*',x) else x for x in newlist]
    newlist = [ ("#"+x) if re.match(r'^[:blank:]*[^#]*MotifD.*',x) else x for x in newlist]
    newlist = [ ("#"+x) if re.match(r'^[:blank:]*[^#]*NeedTcpipLib.*',x) else x for x in newlist]
    newlist = [ ("#"+x) if re.match(r'^[:blank:]*[^#]*SpecialO.*',x) else x for x in newlist]
    newlist = [ ("#"+x) if re.match(r'^[:blank:]*[^#]*SpecialFortran.*',x) else x for x in newlist]
    newlist = [ ("#"+x) if re.match(r'^[:blank:]*[^#]*SQUEEZE.*',x) else x for x in newlist]
    newlist = [ ("#"+x) if re.match(r'^[:blank:]*[^#]*FORTRANSAVEOPTION.*',x) else x for x in newlist]
    newlist = [ ("#"+x) if re.match(r'^[:blank:]*[^#]*FDEBUGFLAGS.*',x) else x for x in newlist]
    newlist = [x.replace(") || (defined(CERNLIB_LINUX) && (!defined(CERNLIB_PPC))"," OR (CERNLIB_LINUX AND (NOT CERNLIB_PPC))") for x in newlist] 
    newlist = [x.replace("#if ( defined(CERNLIB_UNIX OR CERNLIB_VAXVMS) ) && (!defined(CERNLIB_NOCIO))","if ( CERNLIB_UNIX OR CERNLIB_VAXVMS  AND (NOT CERNLIB_NOCIO))") for x in newlist] 
    newlist = [x.replace("(SRCS_F)","{SRCS_F}") for x in newlist]

    fin=["#"+argv, " "] 
    for a in newlist:
      if (len(a) > 0):
       if a[-1] != ')' and a[0] !='#':
        fin.append( (a+")"))
       else:
        fin.append(a)
    dirf=path_to_file.replace("Imakefile","")
    sr=[]
    FSRC=0
    CSRC=0
    CDFSRC=0
    SSRC=0
    for a in fin:
     if re.match(".*_FSRC.*",a):
       FSRC=1
     if re.match(".*_CSRC.*",a):
       CSRC=1
     if re.match(".*_CDFSRC.*",a):
       CDFSRC=1
     if re.match(".*_SSRC.*",a):
       SSRC=1
    
    diractual="../"+dirf
    diractual=diractual.replace("//","/")
    if (FSRC==1):
     fin.append("  list(TRANSFORM "+LISTNAME+"_FSRC PREPEND \"${CMAKE_CURRENT_SOURCE_DIR}/"+diractual+"\")")
     sr.append("${"+LISTNAME+"_FSRC}")
    if (CSRC==1):
      fin.append("  list(TRANSFORM "+LISTNAME+"_CSRC PREPEND \"${CMAKE_CURRENT_SOURCE_DIR}/"+diractual+"\")")
      sr.append("${"+LISTNAME+"_CSRC}")
    if (CDFSRC==1):
      fin.append("  list(TRANSFORM "+LISTNAME+"_CDFSRC PREPEND \"${CMAKE_CURRENT_SOURCE_DIR}/"+diractual+"\")")
      sr.append("${"+LISTNAME+"_CDFSRC}")
    if (SSRC==1):
      fin.append("  list(TRANSFORM "+LISTNAME+"_SSRC PREPEND \"${CMAKE_CURRENT_SOURCE_DIR}/"+diractual+"\")")
      sr.append("${"+LISTNAME+"_SSRC}")  
    lev=0
    fin.append(" ")
    return [[LISTNAME],fin,sr,incfiles]
########################################################################
def write_to_file_with_breaks(f, lin, n):
   p=0
   while p<len(lin) and p>=0:
      np=lin.find(" ",p+n)
      f.write(lin[p:np])
      f.write("\n")
      p=np
########################################################################
def create_library(ldirsI,lname,includes,installincludes,linklibs=[], cdff=[],pat=[ "\"*makefile*\"", "\"*\.c\"" ]):
   ldirs=ldirsI
   ldirs.sort()
   includes.sort()
   installincludes.sort()
   cdff.sort()
   t=[]
   f = open(lname+"/CMakeLists.txt", "w")
   write_header(f,ldirs)
   f.write("set_package_flags("+lname+")\n")
   for a in ldirs:
     x=transform_imake_source(lname+"/"+a,0)
     t+=x[2]
     if len(x[3])>0:
        plt=x[3][0]
        f.write("#The original Imake file below included files:"+plt+"\n#Those were NOT processed.\n")
        U=[]
        #print(lname+"/"+lname+"/"+plt)
        #if os.path.exists(lname+"/"+lname+"/"+plt):
        #  U=transform_pilots(lname+"/"+lname+"/"+plt)
        #print(U)
        #for  tf in U:
        #  f.write(tf+"\n")
     
     for a in x[1]: 
          if a[0] =='#':
            f.write(a+"\n")
          else:
           if re.match(r'.*set.*',a):
              ifcondition = get_if_condition(a)
              if len(ifcondition[0])>0:
                f.write(ifcondition[0]+"\n")
              write_to_file_with_breaks(f, a+"\n", 200)
              if len(ifcondition[1])>0:
                f.write(ifcondition[1]+"\n")
           else:
             f.write(a+"\n")
   f.write("set("+lname+"_esources )\n")
   for cdf in cdff:
      f.write("cdf_compile(${CMAKE_CURRENT_SOURCE_DIR}/"+cdf+" ${CMAKE_CURRENT_BINARY_DIR}/"+cdf.split("/")[-1]+".c)\n")
      f.write("list(APPEND "+lname+"_esources ${CMAKE_CURRENT_BINARY_DIR}/"+cdf.split("/")[-1]+".c)\n")
   suffixes=get_suffixes(lname)
   for suff in suffixes:
     if suff=="": 
       f.write("if (CERNLIB_BUILD_SHARED)\n")
       f.write("add_library("+lname+" SHARED ${"+lname+"_esources}\n")
       for z in t: f.write("                             "+z + " \n")
       f.write(")\n")
     if suff=="_static": 
       f.write("if (CERNLIB_BUILD_STATIC)\n")
       f.write("add_library("+lname+"_static STATIC ${"+lname+"_esources}\n")
       for z in t: f.write("                             "+z + " \n")
       f.write(")\n")
     f.write("target_include_directories("+lname+suff+" PRIVATE ${PROJECT_SOURCE_DIR}/include)\n")
     f.write("target_include_directories("+lname+suff+" PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})\n")
     if os.path.exists(lname+"/"+lname+"/gen"):
       f.write("target_include_directories("+lname+suff+" PRIVATE \"${CMAKE_CURRENT_SOURCE_DIR}/"+lname+"/gen\"  )\n")
     if os.path.exists(lname+"/"+"gen"):
       f.write("target_include_directories("+lname+suff+" PRIVATE \"${CMAKE_CURRENT_SOURCE_DIR}/gen/\")\n")
     for inc in includes:
       if os.path.exists(lname+"/"+inc):
         u="/"+inc
         u=u.replace("//","/")
         f.write("target_include_directories("+lname+suff+" PRIVATE \"${CMAKE_CURRENT_SOURCE_DIR}"+u+"\")\n")
     f.write("target_include_directories("+lname+suff+" PRIVATE ${FREETYPE_INCLUDE_DIRS})\n")
     for ll in linklibs:
       if ll=="packlib":
         ll=ll+suff
       f.write("target_link_libraries("+lname+suff+" PRIVATE "+ll+")\n")
     if if_install_library(lname):
       f.write("install(TARGETS "+lname+suff+" DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)\n")   
     if suff=="_static": 
       f.write("set_target_properties("+lname+"_static PROPERTIES POSITION_INDEPENDENT_CODE ${CERNLIB_POSITION_INDEPENDENT_CODE} OUTPUT_NAME "+output_name_static(lname)+")\n")
       if (link_static(lname)!="no"): 
         if if_install_library(lname):
           f.write("install_symlink(lib"+output_name_static(lname)+".a "+" ${CMAKE_INSTALL_LIBDIR}/lib"+link_static(lname)+".a)\n")
     if suff=="":
       f.write("set_target_properties("+lname+"        PROPERTIES POSITION_INDEPENDENT_CODE ON OUTPUT_NAME "+output_name(lname)+" SOVERSION "+get_full_so_version(lname)+")\n")
       if if_install_library(lname):
         f.write("install_symlink(lib"+output_name(lname)+".so."+get_full_so_version(lname)+" "+"${CMAKE_INSTALL_LIBDIR}/lib"+output_name(lname)+".so."+get_simple_so_version(lname)+")\n")
     f.write("endif()\n")
   for inc in installincludes:
     f.write("install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/"+inc+" DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT devel ")
     for pt in pat:
      f.write(" PATTERN "+ pt +" EXCLUDE ")
     f.write(")\n")
   f.close()
########################################################################
if __name__ == '__main__':
   ldirs ="/Imakefile".split(" ")
   lname="code_motif"
   includes="kuip /".split(" ")
   installincludes=[]
   create_library(ldirs,lname,includes,installincludes,["packlib","${X11_LIBRARIES}","${FREETYPE_LIBRARIES}","${MOTIF_LIBRARIES}", "${X11_Xt_LIB}"],["kuipmcdf.cdf"])
########################################################################
   os.chdir("paw_motif")
   ldirs ="/Imakefile".split(" ")
   lname="xbae"
   includes="/".split(" ")
   installincludes=[]
   create_library(ldirs,lname,includes,installincludes,["${X11_LIBRARIES}","${X11_Xt_LIB}", "${X11_Xaw_LIB}"],[])
   os.chdir("../")
########################################################################
   ldirs ="cdf/Imakefile cmotif/Imakefile code/Imakefile fmotif/Imakefile fpanelsc/Imakefile fpanelsf/Imakefile".split(" ") 
   ldirs += "uimx/Imakefile".split(" ")
   #ldirs += "uimx/Imakefile tree/Imakefile".split(" ")
   lname="paw_motif"
   includes="kuip /".split(" ")
   installincludes=[]
   create_library(ldirs,lname,includes,installincludes,["${X11_LIBRARIES}"],["cdf/pamcdf.cdf"])
########################################################################
   ldirs =  "kernbit/i303/Imakefile".split(" ")   
   ldirs += "kernbit/j530/Imakefile".split(" ")   
   ldirs += "kernbit/m231asm/Imakefile".split(" ")   
   ldirs += "kernbit/m233vax/Imakefile".split(" ")   
   ldirs += "kernbit/m429/Imakefile".split(" ")   
   ldirs += "kernbit/m433/Imakefile".split(" ")  
   ldirs += "kernbit/m437/Imakefile".split(" ")   
   ldirs += "kernbit/m439/Imakefile".split(" ")   
   ldirs += "kernbit/m442/Imakefile".split(" ")   
   ldirs += "kernbit/m443/Imakefile".split(" ")   
   ldirs += "kernbit/t000/Imakefile".split(" ")   
   ldirs += "kernbit/z009/Imakefile".split(" ")   
   ldirs += "kernbit/z265/Imakefile".split(" ")   
   ldirs += "kernbit/z268/Imakefile".split(" ")   
   ldirs += "kerngen/ccgencf/Imakefile".split(" ") 
   ldirs += "kerngen/ccgenci/Imakefile".split(" ")   
   ldirs += "kerngen/ccgenu/Imakefile".split(" ") 
   ldirs += "kerngen/ccgen/Imakefile".split(" ") 
   ldirs += "kerngen/tcgen/Imakefile kerngen/tcgens/Imakefile".split(" ") 
   ldirs += "kerngen/unix/gfortgs/Imakefile".split(" ")  
   ldirs += "kerngen/xvect/Imakefile kernnum/c204fort/Imakefile kernnum/c205fort/Imakefile".split(" ") 
   ldirs += "kernnum/d106fort/Imakefile kernnum/d509fort/Imakefile kernnum/d703fort/Imakefile kernnum/d704fort/Imakefile kernnum/e100fort/Imakefile kernnum/e104fort/Imakefile".split(" ") 
   ldirs += "kernnum/e105fort/Imakefile kernnum/e106fort/Imakefile kernnum/e208fort/Imakefile kernnum/f002fort/Imakefile kernnum/f003fort/Imakefile kernnum/f004fort/Imakefile kernnum/f010fort/Imakefile kernnum/f011fort/Imakefile".split(" ") 
   ldirs += "kernnum/f012fort/Imakefile kernnum/f406fort/Imakefile kernnum/g900fort/Imakefile kernnum/g901fort/Imakefile kernnum/n001fort/Imakefile".split(" ") 
   ldirs += "umon/umonftn/Imakefile".split(" ")  
   lname="kernlib"
   includes="kernali kernbit kerngen kerngen/test kernnum kerngen/kerngen".split(" ") 
   installincludes="kernbit/kernbit kerngen/kerngen kernnum/kernnum".split(" ") 
   create_library(ldirs,lname,includes,installincludes)
########################################################################
   ldirs = "cspack/cz/Imakefile".split(" ")
   ldirs += "cspack/fz/Imakefile".split(" ")
   ldirs += "cspack/sysreq/Imakefile".split(" ")
   ldirs += "cspack/sz/Imakefile".split(" ")
   ldirs += "cspack/tcpaw/Imakefile".split(" ")
   ldirs += "cspack/xz/Imakefile".split(" ")
   ldirs += "epio/code/Imakefile".split(" ")
   ldirs += "epio/util/Imakefile".split(" ")
   ldirs += "fatmen/fatbody/Imakefile".split(" ")
   ldirs += "fatmen/fatuous/Imakefile".split(" ")
   ldirs += "fatmen/fatuser/Imakefile".split(" ")
   ldirs += "fatmen/fatutil/Imakefile".split(" ")
   ldirs += "fatmen/fmc/Imakefile".split(" ")
   ldirs += "fatmen/fmint/Imakefile".split(" ")
   ldirs += "fatmen/fmtms/Imakefile".split(" ")
   ldirs += "fatmen/fmutil/Imakefile".split(" ")
   ldirs += "fatmen/l3util/Imakefile".split(" ")
   ldirs += "ffread/sffread/Imakefile".split(" ")
   ldirs += "hbook/chbook/Imakefile".split(" ")
   ldirs += "hbook/code/Imakefile".split(" ")
   ldirs += "hbook/d/Imakefile".split(" ")
   ldirs += "hbook/fpclassc/Imakefile".split(" ")
   ldirs += "hbook/hmcstat/Imakefile".split(" ")
   ldirs += "hbook/hmerge/Imakefile".split(" ")
   ldirs += "hbook/hmmap/Imakefile".split(" ")
   ldirs += "hbook/hntup/Imakefile".split(" ")
   ldirs += "hbook/hquad/Imakefile".split(" ")
   ldirs += "hbook/hrz/Imakefile".split(" ")
   ldirs += "hepdb/cdcdf/Imakefile".split(" ")
   ldirs += "hepdb/cdc/Imakefile".split(" ")
   ldirs += "hepdb/cddict/Imakefile".split(" ")
   ldirs += "hepdb/cdfzup/Imakefile".split(" ")
   ldirs += "hepdb/cdinit/Imakefile".split(" ")
   ldirs += "hepdb/cdmdir/Imakefile".split(" ")
   ldirs += "hepdb/cdofflin/Imakefile".split(" ")
   ldirs += "hepdb/cdpack/Imakefile".split(" ")
   ldirs += "hepdb/cdpurge/Imakefile".split(" ")
   ldirs += "hepdb/cdread/Imakefile".split(" ")
   ldirs += "hepdb/cdroot/Imakefile".split(" ")
   ldirs += "hepdb/cdstore/Imakefile".split(" ")
   ldirs += "hepdb/cdunpack/Imakefile".split(" ")
   ldirs += "hepdb/cdutil/Imakefile".split(" ")
   ldirs += "kapack/code/Imakefile".split(" ")
   ldirs += "kuip/code_kuip/Imakefile".split(" ")
   ldirs += "minuit/code/Imakefile".split(" ")
   ldirs += "zbook/code/Imakefile".split(" ")
   ldirs += "zbook/ybook/Imakefile".split(" ")
   ldirs += "zebra/dzebra/Imakefile".split(" ")
   ldirs += "zebra/fq/Imakefile".split(" ")
   ldirs += "zebra/jz91/Imakefile".split(" ")
   ldirs += "zebra/mqg/Imakefile".split(" ")
   ldirs += "zebra/mq/Imakefile".split(" ")
   ldirs += "zebra/mqs/Imakefile".split(" ")
   ldirs += "zebra/mqv/Imakefile".split(" ")
   ldirs += "zebra/qend/Imakefile".split(" ")
   ldirs += "zebra/qutil/Imakefile".split(" ")
   ldirs += "zebra/rz/Imakefile".split(" ")
   ldirs += "zebra/tq/Imakefile".split(" ")
#   ldirs += "../mathlib/gen/n/Imakefile".split(" ")
   ldirs += "hbook/n/Imakefile".split(" ")
   lname="packlib"
   includes="cspack epio fatmen ffread ../mathlib/gen hepdb kapack kuip minuit zbook zebra cspack/sysreq".split(" ")
   installincludes="zebra/zebra minuit/minuit kapack/kapack hepdb/hepdb kuip/kuip epio/epio cspack/cspack fatmen/fatmen ffread/ffread zbook/zbook".split(" ")
   pat=["\"*makefile*\"", "\"*\.c\""]
   create_library(ldirs,lname,includes,installincludes,["${crypto}"],["kuip/code_kuip/kuipcdf.cdf"],pat)
########################################################################
   ldirs ="hbook/hdiff/Imakefile bvsl/bvslftn/Imakefile gen/a/Imakefile gen/b/Imakefile gen/c/Imakefile gen/d/Imakefile gen/divon/Imakefile".split(" ")  
   ldirs +="gen/e/Imakefile gen/f/Imakefile gen/g/Imakefile gen/h/Imakefile gen/j/Imakefile gen/m/Imakefile gen/s/Imakefile gen/u/Imakefile gen/v/Imakefile gen/x/Imakefile".split(" ")  
   lname="mathlib"
   includes=[]
   installincludes="gen/gen hbook/hbook".split(" ")
   create_library(ldirs,lname,includes,installincludes)
########################################################################
   os.chdir("graflib")
   lname="higz"
   ldirs = "ged/Imakefile".split(" ")
   ldirs += "higzcc/Imakefile ifalco/Imakefile ig/Imakefile ig3/Imakefile".split(" ")
   ldirs += "ih/Imakefile ikernel/Imakefile".split(" ") 
   ldirs += "ipost/Imakefile iz/Imakefile menu/Imakefile".split(" ")
   includes="../../packlib/kuip".split(" ")
   installincludes="higz".split(" ")
   create_library(ldirs,lname,includes,installincludes)
   os.chdir("../")
########################################################################
   ldirs ="dzdoc/dzdkern/Imakefile dzdoc/dzdraw/Imakefile".split(" ") 
   ldirs += "hplot/hplotcc/Imakefile".split(" ")
   ldirs += "hplot/hplotf77/Imakefile".split(" ")
   lname="graflib"   
   includes="../packlib/kuip hplot dzdoc".split(" ")
   installincludes="higz/higz hplot/hplot dzdoc/dzdoc".split(" ")
   create_library(ldirs,lname,includes,installincludes,["${Xm}"],["dzdoc/cdf/zbrcdf.cdf"])
########################################################################
   ldirs ="fowl/Imakefile genbod/Imakefile wico/Imakefile".split(" ")
   lname="phtools"   
   includes=[]
   installincludes=[]
   create_library(ldirs,lname,includes,installincludes)
########################################################################
   ldirs ="comis/code/Imakefile comis/comisftn/Imakefile comis/comismar/Imakefile comis/deccc/Imakefile comis/dynam/Imakefile".split(" ")
   ldirs +="paw/cdf/Imakefile paw/code/Imakefile paw/cpaw/Imakefile paw/mlpfit/Imakefile paw/ntuple/Imakefile sigma/src/Imakefile".split(" ")
   lname="pawlib"
   includes="paw sigma".split(" ")
   installincludes="paw/paw paw/ntuple sigma/sigma comis/comis".split(" ")
   pat=["\"*makefile*\"", "\"*\.c\"", "tree.h"]
   create_library(ldirs,lname,includes,installincludes,[],["paw/cdf/mlpdef.cdf","paw/cdf/pawcdf.cdf"],pat)
########################################################################
   ldirs =  "block/Imakefile cdf/Imakefile cgpack/Imakefile erdecks/Imakefile erpremc/Imakefile fiface/Imakefile fluka/Imakefile gbase/Imakefile gcons/Imakefile".split(" ") 
   ldirs += "gdraw/Imakefile geocad/Imakefile ggeom/Imakefile gheisha/Imakefile ghits/Imakefile ghrout/Imakefile ghutils/Imakefile giface/Imakefile giopa/Imakefile gkine/Imakefile".split(" ") 
   ldirs += "gparal/Imakefile gphys/Imakefile gscan/Imakefile gstrag/Imakefile gtrak/Imakefile gxint/Imakefile matx55/Imakefile miface/Imakefile miguti/Imakefile neutron/Imakefile peanut/Imakefile".split(" ")
   ldirs += "guser/Imakefile".split(" ")
   lname = "geant321"
   includes="geant321 /".split(" ")
   installincludes="geant321".split(" ")
   pat=["\"*makefile*\"", "\"*\.c\""]
   create_library(ldirs,lname,includes,installincludes,[],["cdf/g321m.cdf","cdf/g321x.cdf"],pat)
########################################################################
   os.chdir("mclibs")
   MCldirs =["code/Imakefile".split(" "),
             "code/Imakefile test/Imakefile".split(" "),
             "code/Imakefile cojdata/Imakefile cojtapew/Imakefile".split(" "), 
             "decays/Imakefile eudini/Imakefile fragmt/Imakefile supdec/Imakefile".split(" "),
             "ariadne/Imakefile code/Imakefile jetset/Imakefile pythia/Imakefile".split(" "),
             "code/Imakefile".split(" "),
             "code/Imakefile".split(" "),
             "code/Imakefile isadata/Imakefile isasusy/Imakefile isatape/Imakefile isarun/Imakefile".split(" "),
             "jetset/Imakefile pythia/Imakefile".split(" "),
             "code/Imakefile".split(" "),
             "npdf/Imakefile spdf/Imakefile tpdf/Imakefile".split(" "),
             "code/Imakefile".split(" "),
             "code/Imakefile".split(" ")
            ] 
   MClname= ["ariadne", "ariadne_407","cojets","eurodec","fritiof", "herwig", "herwig58", "isajet", "jetset", "lepto63", "pdf", "photos", "pythia"]
   for x in range(0,len(MClname) ):
     lname=MClname[x]
     ldirs=MCldirs[x]
     includes="herwig58 herwig59 /".split(" ")+[lname]
     installincludes=[]
     create_library(ldirs,lname,includes,installincludes,[],[],["\"*makefile*\"", "\"*\.c\"","eurodec.inc"])
   os.chdir("../")
########################################################################
   f = open("pawlib/CMakeLists.txt", "a")
   f.write("""
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/../contrib/tree.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/paw)
""")
   f.close()
########################################################################
   f = open("geant321/CMakeLists.txt", "a")
   f.write("""
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/data/flukaaf.dat DESTINATION ${CMAKE_INSTALL_DATADIR}/cernlib/${CERNLIB_VERSION})
""")
   f.close()
########################################################################
   f = open("mclibs/cojets/CMakeLists.txt", "a")
   f.write("""
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/cojets DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT libs PATTERN "*makefile*" EXCLUDE )
add_subdirectory(data)
""")
   f.close()
########################################################################
   f = open("mclibs/cojets/data/CMakeLists.txt", "w")
   f.write("""
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/cojets.cpp ${CMAKE_CURRENT_BINARY_DIR}/cojets.cin)
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/decay.cpp ${CMAKE_CURRENT_BINARY_DIR}/decay.cin)
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/table.cpp ${CMAKE_CURRENT_BINARY_DIR}/table.cin)     
add_custom_target( cojets.dat ALL BYPRODUCTS ${CMAKE_CURRENT_BINARY_DIR}/cojets.dat 
                        DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/table.cin  ${CMAKE_CURRENT_BINARY_DIR}/decay.cin ${CMAKE_CURRENT_BINARY_DIR}/cojets.cin
                        COMMAND ${CPP} -x c -E -traditional  -o ${CMAKE_CURRENT_BINARY_DIR}/cojets.dat ${CMAKE_CURRENT_BINARY_DIR}/cojets.cin
                        COMMAND ${SED} -i -e "/^#  *[0-9][0-9]*  *.*$$/d" -e "/^XCOMM$$/s//#/" -e "/^XCOMM[^a-zA-Z0-9_]/s/^XCOMM/#/" -e "/^# [0-9][0-9]/d" -e "/^#line /d"    ${CMAKE_CURRENT_BINARY_DIR}/cojets.dat
                        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
                       )
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/cojets.dat DESTINATION ${CMAKE_INSTALL_DATADIR}/cernlib/${CERNLIB_VERSION})
""")     
   f.close()
########################################################################
   f = open("mclibs/isajet/CMakeLists.txt", "a")
   f.write("""
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/isajet DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT libs PATTERN "*makefile*" EXCLUDE )
add_subdirectory(data)
""")
   f.close()
########################################################################
   f = open("mclibs/isajet/data/CMakeLists.txt", "w")
   f.write("""
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/decay.cpp ${CMAKE_CURRENT_BINARY_DIR}/decay.cin)
add_custom_target( isajet.dat ALL BYPRODUCTS ${CMAKE_CURRENT_BINARY_DIR}/isajet.dat 
                        DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/decay.cin
                        COMMAND ${CPP} -x c -traditional -E  -o ${CMAKE_CURRENT_BINARY_DIR}/isajet.dat ${CMAKE_CURRENT_BINARY_DIR}/decay.cin
                        COMMAND ${SED} -i -e "/^#  *[0-9][0-9]*  *.*$$/d" -e "/^XCOMM$$/s//#/" -e "/^XCOMM[^a-zA-Z0-9_]/s/^XCOMM/#/" -e "/^# [0-9][0-9]/d" -e "/^#line /d"  ${CMAKE_CURRENT_BINARY_DIR}/isajet.dat
                        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
                       )
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/isajet.dat DESTINATION ${CMAKE_INSTALL_DATADIR}/cernlib/${CERNLIB_VERSION})
""")     
   f.close()
########################################################################
   f = open("mclibs/eurodec/CMakeLists.txt", "a")
   f.write("""
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/eurodec DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT libs PATTERN "*makefile*" EXCLUDE )
file(READ ${CMAKE_CURRENT_SOURCE_DIR}/eurodec/eufiles.inc FILE_CONTENTS)
string(REPLACE "eurodec.dat" "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_DATADIR}/cernlib/${CERNLIB_VERSION}/eurodec.dat" FILE_CONTENTS ${FILE_CONTENTS})
file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/eufiles.inc ${FILE_CONTENTS})
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/eufiles.inc DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/eurodec/)
""") 
   f.close()
########################################################################
   f = open("mclibs/herwig/CMakeLists.txt", "a")
   f.write("""
if (CERNLIB_BUILD_SHARED)   
  target_include_directories(herwig PRIVATE "${CMAKE_CURRENT_BINARY_DIR}/herwig59")
endif()
if (CERNLIB_BUILD_STATIC)   
  target_include_directories(herwig_static PRIVATE "${CMAKE_CURRENT_BINARY_DIR}/herwig59\")
endif()
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/herwig59/herwig59.inc ${CMAKE_CURRENT_BINARY_DIR}/herwig59/HERWIG59.INC)
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/herwig59 DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT libs PATTERN "*makefile*" EXCLUDE PATTERN "*HERWIG59.INC*" EXCLUDE )
""")
   f.close()
########################################################################
   f = open("mclibs/pdf/CMakeLists.txt", "a")
   f.write("""
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/pdf DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT libs PATTERN "*makefile*" EXCLUDE )
if(CERNLIB_ENABLE_TEST)
  ENABLE_TESTING()
  add_subdirectory(tpdf)
endif()
""")
   f.close()
########################################################################
   mcg="photos ariadne fritiof pythia jetset isajet herwig cojets lepto63".split(" ")
   for a in mcg:
     f = open("mclibs/"+a+"/CMakeLists.txt", "a")
     f.write("""
if(CERNLIB_ENABLE_TEST)
  ENABLE_TESTING()
  add_subdirectory(test)
endif()
"""  )
     f.close()   
   f = open("mclibs/eurodec/CMakeLists.txt", "a")
   f.write("""
if(CERNLIB_ENABLE_TEST)
  ENABLE_TESTING()
  add_subdirectory(eudtest)
endif()
"""  )
   f.close()   
########################################################################
   f = open("mathlib/CMakeLists.txt", "a")
   f.write("""
if(CERNLIB_ENABLE_TEST)
  ENABLE_TESTING()
  add_subdirectory(bvsl/test)
  add_subdirectory(gen/tests)
endif()
"""  )
   f.close()
########################################################################
   f = open("packlib/CMakeLists.txt", "a")
   f.write("""
set(FF "f2cFortran")
if (CERNLIB_QMLXIA64) 
if (CERNLIB_GFORTRAN)
set(FF "gFortran")
else()
set(FF "f2cFortran")
endif()
endif()
if (CMAKE_C_COMPILER_ID STREQUAL "Intel")
set(SR _DEFAULT_SOURCE)
else()
set(SR _SVID_SOURCE)
endif()
foreach(x IN LISTS packlib_hbook_chbook_CSRC)
   set_source_files_properties(${x} PROPERTIES COMPILE_DEFINITIONS "${SR};${FF}")
endforeach()
if (CERNLIB_LINUX)
foreach(x IN LISTS packlib_cspack_sysreq_CSRC)
   set_source_files_properties(${x} PROPERTIES COMPILE_DEFINITIONS "LINUX")
endforeach()
endif()
if(CERNLIB_ENABLE_TEST)
  ENABLE_TESTING()
  #STRANGE! add_subdirectory(hbook/tests)
  add_subdirectory(ffread/test)
  add_subdirectory(kapack/test)
  add_subdirectory(zbook/test)
  add_subdirectory(zebra/test)
  add_subdirectory(epio/tests)
  add_subdirectory(minuit/examples)
  add_subdirectory(kuip/examples)
endif()
     """  )
   f.close()
########################################################################
   f = open("pawlib/CMakeLists.txt", "a")
   f.write("""

set(FF "f2cFortran")
if (CERNLIB_QMLXIA64) 
if (CERNLIB_GFORTRAN)
set(FF "gFortran")
else()
set(FF "f2cFortran")
endif()
endif()
foreach(x IN LISTS 
                      pawlib_paw_ntuple_FSRC
                      pawlib_paw_ntuple_CSRC
                      pawlib_comis_deccc_CSRC
                      pawlib_paw_cpaw_CSRC
                     pawlib_paw_mlpfit_CSRC
                     pawlib_paw_mlpfit_FSRC
                      )
   set_source_files_properties(${x} PROPERTIES COMPILE_DEFINITIONS ${FF})
endforeach()
if(CERNLIB_ENABLE_TEST)
  ENABLE_TESTING()
  add_subdirectory(comis/test)
endif()
"""  )
   f.close() 
########################################################################
   f = open("kernlib/CMakeLists.txt", "a")
   f.write("""
if(CERNLIB_ENABLE_TEST)
  ENABLE_TESTING()
  add_subdirectory(kerngen/test)
  add_subdirectory(kernnum/test)
  add_subdirectory(kernbit/test)
endif()
"""  )
   f.close() 
########################################################################
   f = open("geant321/CMakeLists.txt", "a")
   f.write("""
foreach(x IN LISTS 
                             geant321_block_FSRC 
                             geant321_cdf_CDFSRC 
                             geant321_cgpack_FSRC 
                             geant321_fiface_FSRC 
                             geant321_fluka_FSRC 
                             geant321_gbase_FSRC 
                             geant321_gcons_FSRC 
                             geant321_gdraw_FSRC 
                             geant321_geocad_FSRC 
                             geant321_ggeom_FSRC
                             geant321_gheisha_FSRC 
                             geant321_ghits_FSRC 
                             geant321_ghrout_FSRC 
                             geant321_ghutils_FSRC 
                             geant321_giface_FSRC 
                             geant321_giopa_FSRC 
                             geant321_gkine_FSRC 
                             geant321_gparal_FSRC 
                             geant321_gphys_FSRC 
                             geant321_gscan_FSRC 
                             geant321_gstrag_FSRC 
                             geant321_gtrak_FSRC 
                             geant321_guser_FSRC 
                             geant321_gxint_FSRC 
                             geant321_miface_FSRC 
                             geant321_miguti_FSRC
                             geant321_neutron_FSRC 
                             geant321_peanut_FSRC)
   set_source_files_properties(${x} PROPERTIES COMPILE_DEFINITIONS "CERNLIB_BLDLIB")
#The following directories will not get the flag.
#                             geant321_matx55_FSRC
#                             geant321_erdecks_FSRC
#                             geant321_erpremc_FSRC 

endforeach()
if(CERNLIB_ENABLE_TEST)
  ENABLE_TESTING()
  add_subdirectory(examples)
endif()
     """  )
   f.close()
########################################################################
   f = open("phtools/CMakeLists.txt", "a")
   f.write("""
if(CERNLIB_ENABLE_TEST)
  ENABLE_TESTING()
  add_subdirectory(wicoexam)
endif()
"""  )
   f.close() 
########################################################################
