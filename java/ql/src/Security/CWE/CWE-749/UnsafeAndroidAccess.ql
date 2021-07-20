/**
 * @name Unsafe resource fetching in Android webview
 * @description JavaScript rendered inside WebViews can access any protected
 *              application file and web resource from any origin
 * @kind path-problem
 * @problem.severity warning
 * @precision medium
 * @id java/android/unsafe-android-webview-fetch
 * @tags security
 *       external/cwe/cwe-749
 *       external/cwe/cwe-079
 */

import java
import semmle.code.java.security.UnsafeAndroidAccessQuery
import DataFlow::PathGraph

from DataFlow::PathNode source, DataFlow::PathNode sink, FetchUntrustedResourceConfiguration conf
where conf.hasFlowPath(source, sink)
select sink.getNode(), source, sink, "Unsafe resource fetching in Android webview due to $@.",
  source.getNode(), sink.getNode().(UrlResourceSink).getSinkType()
