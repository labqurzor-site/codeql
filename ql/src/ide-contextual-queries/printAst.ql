/**
 * @name Print AST
 * @description Produces a representation of a file's Abstract Syntax Tree.
 *              This query is used by the VS Code extension.
 * @id ruby/print-ast
 * @kind graph
 * @tags ide-contextual-queries/print-ast
 */

import codeql_ruby.printAst
import codeql.IDEContextual

/**
 * The source file to generate an AST from.
 */
external string selectedSourceFile();

/**
 * Overrides the configuration to print only nodes in the selected source file.
 */
class Cfg extends PrintAstConfiguration {
  override predicate shouldPrintNode(Generated::AstNode n) {
    n.getLocation().getFile() = getFileBySourceArchiveName(selectedSourceFile())
  }
}