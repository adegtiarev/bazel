#    ------ BEGIN LICENSE ATTRIBUTION ------
#    
#    Portions of this file have been appropriated or derived from the following project(s) and therefore require attribution to the original licenses and authors.
#    
#    Project: https://bazel.build
#    Release: https://github.com/bazelbuild/bazel/releases/tag/4.2.4
#    Source File: input.bzl
#    
#    Copyrights:
#      copyright (c) year name of author gnomovision comes
#      copyright eastman kodak company 1992
#      copyright (c) 1991-9 silicon graphics, inc. all rights reserved.  3.5. cid
#      copyright [2007] google inc
#      copyright [2007] neal norwitz
#      (c) copyright ibm corp. 1999 all rights reserved
#      copyright 2009 brian quinlan. all rights reserved
#      copyright (c) 2001 by bigelow & holmes inc. luxi font instruction
#      copyright (c) 2003 by bitstream, inc. all rights reserved. bitstream vera is a
#      copyright 1999 by coolservlets.com
#      copyright (c) 1998 by the fundsxpress, inc
#      copyright (c) 2001 by urw++ gmbh. all rights reserved. luxi is a
#      copyright 2012, cedric beust
#      copyright (c) 2012 daniel dreibrodt
#      copyright �� 2011 ecma international
#      copyright (c) 1997  eric s. raymond
#      copyright (c) 2012 france t��l��com all rights reserved
#      copyright 2008, google inc
#      copyright 2008 google inc.  all rights reserved
#      copyright (c) 2002 graz university of technology. all rights reserved
#      copyright (c) 2002 json.org
#      copyright (c) 2007 mockito contributors
#      copyright (c) 1998 national electronics and computer technology center
#      copyright (c) 1996 nvidia, corp. all rights reserved
#      copyright (c) 1996 nvidia, corp. nvidia design patents pending in the u.s. and
#      copyright (c) 2011 petteri aimonen <jpa at nanopb.mail.kapsi.fi>
#      copyright (c) 2012 sparkle.org and andy matuschak
#      copyright (c) 2012, the android open source project
#      copyright 2017 the bazel authors. all rights reserved
#      copyright (c) 2007 the khronos group inc
#      copyright (c) 2003 the netbsd foundation, inc. all rights reserved
#      copyright 1997 the open group research institute. all rights reserved
#      copyright (c) 1993 the regents of the university of california. all rights
#      copyright (c) 1982 the royal institute, thai royal government
#      copyright (c) 1998 todd c. miller <todd.miller@courtesan.com>
#      copyright-software-20021231
#      copyright (c) 1989, 1991 free software foundation, inc. 59 temple place, suite 330, boston, ma 02111-1307 usa
#      copyright theodore ts'o, 1994, 1995, 1996, 1997, 1998, 1999. all rights
#      copyright (c) 1995, 1996 guy eric schalnat, group 42, inc
#      copyright (c) 1996, 1997 andreas dilger
#      copyright (c) 1991-1998, thomas g. lane
#      copyright 1996-1999 by scott hudson, frank flannery, c. scott ananian
#      copyright (c) 1989, 1991 free software foundation, inc
#      copyright (c) 1994-1999 silicon graphics, inc
#      copyright (c) 1994-1999 silicon graphics, inc. all rights reserved
#      copyright (c) 1995,1999 theo de raadt. all rights reserved. copyright (c)
#      copyright (c) 1996-2000 laszlo molnar
#      copyright (c) 1996-2000 markus franz xaver johannes oberhumer
#      copyright (c) 1996-2000 markus oberhumer & laszlo molnar
#      copyright (c) 1999-2002  brian paul   all rights reserved
#      copyright (c) 1998, 1999 glenn randers-pehrson, and are
#      copyright (c) 2000-2003 daisuke okajima and kohsuke kawaguchi
#      copyright �� 2001,2003 keith packard
#      copyright (c) 1994-2003 the xfree86 project, inc. all rights reserved
#      copyright (c) 1999-2004 david corcoran <corcoran@linuxnet.com>
#      copyright (c) 1999-2004 ludovic rousseau <ludovic.rousseau (at) free.fr>
#      copyright (c) 1994-2004 the xfree86 project, inc.    all rights reserved
#      copyright (c) 2001-2004 thomas winischhofer
#      copyright 2003-2005 colin percival
#      copyright (c) 1995-2005 the cryptix foundation limited
#      copyright (c) 2004, 2006-2011 glenn randers-pehrson, and are
#      copyright (c) 2000-2006, www.hamcrest.org
#      copyright (c) 2007-2009, jsr305 expert group
#      copyright (c) 2004-2009 paul r. holser, jr
#      copyright (c) 1995-2010 international business machines corporation and others
#      copyright (c) 1998-2010 marti maria saguer
#      copyright (c) 2000-2011 france t��l��com
#      copyright (c) 2000-2011 inria, france telecom
#      copyright (c) 2003-2012, michael foord
#      copyright �� 1991-2012 unicode, inc. all rights reserved. distributed under the
#      copyright (c) 2009-2013, attila szegedi
#      copyright (c) 2004-2013 qos.ch
#      copyright �� 1991-2013 unicode, inc. all rights reserved
#      copyright (c) 2010-2015 benjamin peterson
#      copyright �� 2009, 2016 mountainminds gmbh & co. kg and contributors
#      copyright (c) 2011-2016 twitter, inc
#      copyright (c) 1995-2005 jean-loup gailly and mark adler
#    
#    Licenses:
#      BSD 3-Clause "New" or "Revised" License
#      SPDXId: BSD-3-Clause
#    
#    Auto-attribution by Threatrix, Inc.
#    
#    ------ END LICENSE ATTRIBUTION ------
"""Rules for ANTLR 3."""

def _generate(ctx):
    return None

antlr = rule(
    implementation = _generate,
    doc = "Runs [ANTLR 3](https://www.antlr3.org//) on a set of grammars.",
    attrs = {
        "debug": attr.bool(default = False, doc = "Generate a parser that emits debugging events."),
        "depend": attr.bool(default = False, doc = "Generate file dependencies; don't actually run antlr."),
        "deps": attr.label_list(
            default = [Label("@antlr3_runtimes//:tool")],
            doc = """
The dependencies to use. Defaults to the most recent ANTLR 3 release,
but if you need to use a different version, you can specify the
dependencies here.
""",
        ),
        "dfa": attr.bool(default = False, doc = "Generate a DFA for each decision point."),
        "dump": attr.bool(default = False, doc = "Print out the grammar without actions."),
        "imports": attr.label_list(allow_files = True, doc = "The grammar and .tokens files to import. Must be all in the same directory."),
        "language": attr.string(doc = "The code generation target language. Either C, Cpp, CSharp2, CSharp3, JavaScript, Java, ObjC, Python, Python3 or Ruby (case-sensitive)."),
        "message_format": attr.string(doc = "Specify output style for messages."),
        "nfa": attr.bool(default = False, doc = "Generate an NFA for each rule."),
        "package": attr.string(doc = "The package/namespace for the generated code."),
        "profile": attr.bool(default = False, doc = "Generate a parser that computes profiling information."),
        "report": attr.bool(default = False, doc = "Print out a report about the grammar(s) processed."),
        "srcs": attr.label_list(allow_files = True, mandatory = True, doc = "The grammar files to process."),
        "trace": attr.bool(default = False, doc = "Generate a parser with trace output. If the default output is not enough, you can override the traceIn and traceOut methods."),
        "Xconversiontimeout": attr.int(doc = "Set NFA conversion timeout for each decision."),
        "Xdbgconversion": attr.bool(default = False, doc = "Dump lots of info during NFA conversion."),
        "Xdbgst": attr.bool(default = False, doc = "Put tags at start/stop of all templates in output."),
        "Xdfa": attr.bool(default = False, doc = "Print DFA as text."),
        "Xdfaverbose": attr.bool(default = False, doc = "Generate DFA states in DOT with NFA configs."),
        "Xgrtree": attr.bool(default = False, doc = "Print the grammar AST."),
        "Xm": attr.int(doc = "Max number of rule invocations during conversion."),
        "Xmaxdfaedges": attr.int(doc = "Max &quot;comfortable&quot; number of edges for single DFA state."),
        "Xmaxinlinedfastates": attr.int(doc = "Max DFA states before table used rather than inlining."),
        "Xminswitchalts": attr.int(doc = "Don't generate switch() statements for dfas smaller than given number."),
        "Xmultithreaded": attr.bool(default = False, doc = "Run the analysis in 2 threads."),
        "Xnfastates": attr.bool(default = False, doc = "For nondeterminisms, list NFA states for each path."),
        "Xnocollapse": attr.bool(default = False, doc = "Collapse incident edges into DFA states."),
        "Xnoprune": attr.bool(default = False, doc = "Do not test EBNF block exit branches."),
        "Xnomergestopstates": attr.bool(default = False, doc = "Max DFA states before table used rather than inlining."),
        "XsaveLexer": attr.bool(default = False, doc = "For nondeterminisms, list NFA states for each path."),
        "Xwatchconversion": attr.bool(default = False, doc = "Don't delete temporary lexers generated from combined grammars."),
        "_tool": attr.label(
            executable = True,
            cfg = "host",
        ),
    },
)
