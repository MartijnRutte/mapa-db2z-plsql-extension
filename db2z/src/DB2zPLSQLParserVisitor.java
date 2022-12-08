// Generated from src/DB2zPLSQLParser.g4 by ANTLR 4.9.2
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link DB2zPLSQLParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface DB2zPLSQLParserVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#startRule}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStartRule(DB2zPLSQLParser.StartRuleContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#adminCmdDsn}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAdminCmdDsn(DB2zPLSQLParser.AdminCmdDsnContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#admCmdDsnTerminator}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAdmCmdDsnTerminator(DB2zPLSQLParser.AdmCmdDsnTerminatorContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#admCmdDsnReturnCode}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAdmCmdDsnReturnCode(DB2zPLSQLParser.AdmCmdDsnReturnCodeContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#bind}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBind(DB2zPLSQLParser.BindContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#bindOptions}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBindOptions(DB2zPLSQLParser.BindOptionsContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#accelerator}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAccelerator(DB2zPLSQLParser.AcceleratorContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#accelerationwaitfordata}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAccelerationwaitfordata(DB2zPLSQLParser.AccelerationwaitfordataContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#acquire}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAcquire(DB2zPLSQLParser.AcquireContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#action}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAction(DB2zPLSQLParser.ActionContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#apcompare}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitApcompare(DB2zPLSQLParser.ApcompareContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#applcompat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitApplcompat(DB2zPLSQLParser.ApplcompatContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#apretaindup}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitApretaindup(DB2zPLSQLParser.ApretaindupContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#apreuse}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitApreuse(DB2zPLSQLParser.ApreuseContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#apreusesource}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitApreusesource(DB2zPLSQLParser.ApreusesourceContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#archivesensitive}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitArchivesensitive(DB2zPLSQLParser.ArchivesensitiveContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#bustimesensitive}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBustimesensitive(DB2zPLSQLParser.BustimesensitiveContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#cachesize}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCachesize(DB2zPLSQLParser.CachesizeContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#cics}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCics(DB2zPLSQLParser.CicsContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#collid}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCollid(DB2zPLSQLParser.CollidContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#concentratestmt}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitConcentratestmt(DB2zPLSQLParser.ConcentratestmtContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#concurrentaccessresolution}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitConcurrentaccessresolution(DB2zPLSQLParser.ConcurrentaccessresolutionContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#copy}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCopy(DB2zPLSQLParser.CopyContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#copyver}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCopyver(DB2zPLSQLParser.CopyverContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#currentdata}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCurrentdata(DB2zPLSQLParser.CurrentdataContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#currentserver}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCurrentserver(DB2zPLSQLParser.CurrentserverContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#dbprotocol}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDbprotocol(DB2zPLSQLParser.DbprotocolContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#date}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDate(DB2zPLSQLParser.DateContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#dec}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDec(DB2zPLSQLParser.DecContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#decdel}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDecdel(DB2zPLSQLParser.DecdelContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#defer}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDefer(DB2zPLSQLParser.DeferContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#degree}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDegree(DB2zPLSQLParser.DegreeContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#deploy}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDeploy(DB2zPLSQLParser.DeployContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#description}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDescription(DB2zPLSQLParser.DescriptionContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#descstat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDescstat(DB2zPLSQLParser.DescstatContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#disable}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDisable(DB2zPLSQLParser.DisableContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#disconnect}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDisconnect(DB2zPLSQLParser.DisconnectContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#dlibatch}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDlibatch(DB2zPLSQLParser.DlibatchContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#dynamicrules}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDynamicrules(DB2zPLSQLParser.DynamicrulesContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#enable}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitEnable(DB2zPLSQLParser.EnableContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#encoding}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitEncoding(DB2zPLSQLParser.EncodingContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#explain}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExplain(DB2zPLSQLParser.ExplainContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#extendedindicator}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExtendedindicator(DB2zPLSQLParser.ExtendedindicatorContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#filter}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFilter(DB2zPLSQLParser.FilterContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#flag}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFlag(DB2zPLSQLParser.FlagContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#generic}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitGeneric(DB2zPLSQLParser.GenericContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#getaccelarchive}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitGetaccelarchive(DB2zPLSQLParser.GetaccelarchiveContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#immedwrite}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitImmedwrite(DB2zPLSQLParser.ImmedwriteContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#imsbmp}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitImsbmp(DB2zPLSQLParser.ImsbmpContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#imsmpp}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitImsmpp(DB2zPLSQLParser.ImsmppContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#isolation}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIsolation(DB2zPLSQLParser.IsolationContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#keepdynamic}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitKeepdynamic(DB2zPLSQLParser.KeepdynamicContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#library}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLibrary(DB2zPLSQLParser.LibraryContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#member}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMember(DB2zPLSQLParser.MemberContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#name}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitName(DB2zPLSQLParser.NameContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#nodefer}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNodefer(DB2zPLSQLParser.NodeferContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#nopklist}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNopklist(DB2zPLSQLParser.NopklistContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#opthint}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitOpthint(DB2zPLSQLParser.OpthintContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#copyoptions}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCopyoptions(DB2zPLSQLParser.CopyoptionsContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#owner}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitOwner(DB2zPLSQLParser.OwnerContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#dsnpackage}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDsnpackage(DB2zPLSQLParser.DsnpackageContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#path}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPath(DB2zPLSQLParser.PathContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#pathdefault}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPathdefault(DB2zPLSQLParser.PathdefaultContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#pklist}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPklist(DB2zPLSQLParser.PklistContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#plan}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPlan(DB2zPLSQLParser.PlanContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#planmgmt}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPlanmgmt(DB2zPLSQLParser.PlanmgmtContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#progauth}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProgauth(DB2zPLSQLParser.ProgauthContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#qualifier}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitQualifier(DB2zPLSQLParser.QualifierContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#queryacceleration}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitQueryacceleration(DB2zPLSQLParser.QueryaccelerationContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#queryid}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitQueryid(DB2zPLSQLParser.QueryidContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#release}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitRelease(DB2zPLSQLParser.ReleaseContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#reopt}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitReopt(DB2zPLSQLParser.ReoptContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#replver}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitReplver(DB2zPLSQLParser.ReplverContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#rounding}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitRounding(DB2zPLSQLParser.RoundingContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#service}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitService(DB2zPLSQLParser.ServiceContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#sqlddname}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSqlddname(DB2zPLSQLParser.SqlddnameContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#sqlencoding}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSqlencoding(DB2zPLSQLParser.SqlencodingContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#sqlerror}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSqlerror(DB2zPLSQLParser.SqlerrorContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#sqlrules}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSqlrules(DB2zPLSQLParser.SqlrulesContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#strdel}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStrdel(DB2zPLSQLParser.StrdelContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#dsnswitch}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDsnswitch(DB2zPLSQLParser.DsnswitchContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#systimesensitive}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSystimesensitive(DB2zPLSQLParser.SystimesensitiveContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#time}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitTime(DB2zPLSQLParser.TimeContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#validate}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitValidate(DB2zPLSQLParser.ValidateContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#version}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVersion(DB2zPLSQLParser.VersionContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#bindQuery}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBindQuery(DB2zPLSQLParser.BindQueryContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#bindQueryOptions}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBindQueryOptions(DB2zPLSQLParser.BindQueryOptionsContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#lookup}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLookup(DB2zPLSQLParser.LookupContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#explaininputschema}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExplaininputschema(DB2zPLSQLParser.ExplaininputschemaContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#dsn}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDsn(DB2zPLSQLParser.DsnContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#dsnOptions}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDsnOptions(DB2zPLSQLParser.DsnOptionsContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#system}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSystem(DB2zPLSQLParser.SystemContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#retry}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitRetry(DB2zPLSQLParser.RetryContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#test}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitTest(DB2zPLSQLParser.TestContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#group}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitGroup(DB2zPLSQLParser.GroupContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#asuser}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAsuser(DB2zPLSQLParser.AsuserContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#free}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFree(DB2zPLSQLParser.FreeContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#freeOptions}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFreeOptions(DB2zPLSQLParser.FreeOptionsContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#stabilized_dynamic_query}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStabilized_dynamic_query(DB2zPLSQLParser.Stabilized_dynamic_queryContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#dsnQuery}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDsnQuery(DB2zPLSQLParser.DsnQueryContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#planmgmtscope}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPlanmgmtscope(DB2zPLSQLParser.PlanmgmtscopeContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#invalidonly}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitInvalidonly(DB2zPLSQLParser.InvalidonlyContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#stblgrp}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStblgrp(DB2zPLSQLParser.StblgrpContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#sdqstmtid}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSdqstmtid(DB2zPLSQLParser.SdqstmtidContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#rebind}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitRebind(DB2zPLSQLParser.RebindContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#rebindTrigger}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitRebindTrigger(DB2zPLSQLParser.RebindTriggerContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#arg}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitArg(DB2zPLSQLParser.ArgContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#libargs}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLibargs(DB2zPLSQLParser.LibargsContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#libmember}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLibmember(DB2zPLSQLParser.LibmemberContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#continuation}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitContinuation(DB2zPLSQLParser.ContinuationContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#adminCmdDb2}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAdminCmdDb2(DB2zPLSQLParser.AdminCmdDb2Context ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#admCmdDb2Terminator}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAdmCmdDb2Terminator(DB2zPLSQLParser.AdmCmdDb2TerminatorContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#admCmdDb2CommandLength}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAdmCmdDb2CommandLength(DB2zPLSQLParser.AdmCmdDb2CommandLengthContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#processingType}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProcessingType(DB2zPLSQLParser.ProcessingTypeContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#processingTypes}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProcessingTypes(DB2zPLSQLParser.ProcessingTypesContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#db2Member}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDb2Member(DB2zPLSQLParser.Db2MemberContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#commandsExecuted}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCommandsExecuted(DB2zPLSQLParser.CommandsExecutedContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#ifiReturnCode}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIfiReturnCode(DB2zPLSQLParser.IfiReturnCodeContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#ifiReasonCode}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIfiReasonCode(DB2zPLSQLParser.IfiReasonCodeContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#excessBytes}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExcessBytes(DB2zPLSQLParser.ExcessBytesContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#groupIfiReasonCode}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitGroupIfiReasonCode(DB2zPLSQLParser.GroupIfiReasonCodeContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#groupExcessBytes}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitGroupExcessBytes(DB2zPLSQLParser.GroupExcessBytesContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#returnMsg}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitReturnMsg(DB2zPLSQLParser.ReturnMsgContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#admCmdDb2ReturnCode}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAdmCmdDb2ReturnCode(DB2zPLSQLParser.AdmCmdDb2ReturnCodeContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#db2Commands}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDb2Commands(DB2zPLSQLParser.Db2CommandsContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#display}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDisplay(DB2zPLSQLParser.DisplayContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#terminate}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitTerminate(DB2zPLSQLParser.TerminateContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#dsnutilCall}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDsnutilCall(DB2zPLSQLParser.DsnutilCallContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#utilTerminator}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitUtilTerminator(DB2zPLSQLParser.UtilTerminatorContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#utilityId}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitUtilityId(DB2zPLSQLParser.UtilityIdContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#restart}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitRestart(DB2zPLSQLParser.RestartContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#utStmts}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitUtStmts(DB2zPLSQLParser.UtStmtsContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#utilities}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitUtilities(DB2zPLSQLParser.UtilitiesContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#reorg}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitReorg(DB2zPLSQLParser.ReorgContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#imageCopy}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitImageCopy(DB2zPLSQLParser.ImageCopyContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#modifyRecovery}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitModifyRecovery(DB2zPLSQLParser.ModifyRecoveryContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#load}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLoad(DB2zPLSQLParser.LoadContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#exec}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExec(DB2zPLSQLParser.ExecContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#runStats}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitRunStats(DB2zPLSQLParser.RunStatsContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#rebuildIndex}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitRebuildIndex(DB2zPLSQLParser.RebuildIndexContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#quiesce}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitQuiesce(DB2zPLSQLParser.QuiesceContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#statistics}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStatistics(DB2zPLSQLParser.StatisticsContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#statTableSpec}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStatTableSpec(DB2zPLSQLParser.StatTableSpecContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#statIndexSpec}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStatIndexSpec(DB2zPLSQLParser.StatIndexSpecContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#corrStatSpec}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCorrStatSpec(DB2zPLSQLParser.CorrStatSpecContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#listdef}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitListdef(DB2zPLSQLParser.ListdefContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#includeTablespace}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIncludeTablespace(DB2zPLSQLParser.IncludeTablespaceContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#includeIndexspace}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIncludeIndexspace(DB2zPLSQLParser.IncludeIndexspaceContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#includeIndex}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIncludeIndex(DB2zPLSQLParser.IncludeIndexContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#template}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitTemplate(DB2zPLSQLParser.TemplateContext ctx);
	/**
	 * Visit a parse tree produced by {@link DB2zPLSQLParser#returnCode}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitReturnCode(DB2zPLSQLParser.ReturnCodeContext ctx);
}