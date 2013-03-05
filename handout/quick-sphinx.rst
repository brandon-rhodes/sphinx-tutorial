
Sphinx Quick Reference
======================

::

 .. note::

    After saying ``note::``, provide one or more indented paragraphs.
    Also: warning, versionadded, versionchanged, deprecated, seealso,
    rubric, centered, hlist, glossary, productionlist.

 .. code-block:: c

    /* Or say "highlight::" once to set the language for all of the
     * code blocks that follow it.  Options include ":linenos:",
     * ":linenothreshold:", and ":emphasize-lines: 1,2,3".
     */
    char s[] = "You can also say 'python', 'ruby', ..., or 'guess'!";

 .. literalinclude:: example.py
    :lines: 10-20
    :emphasize-lines: 15,16

 .. testcode::

    print 'The doctest extension supports code without >>> prompts!'

 .. testoutput::

    The doctest extension supports code without >>> prompts!

 .. _custom-label:
 .. index:: single: paragraph, targeted paragraph, indexed paragraph

 This paragraph can be targeted with :ref:`custom-label`, and will also
 be the :index:`target` of several index entries!

 :ref:`custom-label`             :class:`~module.class`
 :doc:`quick-sphinx`             :method:`~module.class.method()`
 :mod:`module`                   :attr: `~module.class.attribute`

 (See the Sphinx “Inline Markup” chapter for MANY more examples!)
