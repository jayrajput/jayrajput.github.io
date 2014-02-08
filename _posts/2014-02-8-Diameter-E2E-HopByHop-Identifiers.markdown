---
layout: post
title:  Why not reuse Diameter End-to-End Identifier for matching request/replies?
date:   2014-02-08
---

Diameter header contains two UINT32 fields -  Hop-by-Hop Identifier and
End-to-End Identifier.

Hop-by-Hop Identifier aids in matching request and replies. When sending a
request, the Hop-by-Hop Identifier SHOULD be set to a locally unique value. The
Identifier MUST be unique on a given connection at any given time.

End-to-End Identifier is used to detect duplicate messages. The combination of
the Origin-Host AVP and this field is used to detect duplicate messages. The
Identifier MUST remain locally unique for a period of at least 4 minutes.

Since End-to-End Identifier is locally unique it is possible that two Diameter
client may send a request to a Diameter agent with same End-to-End Identifier.
This is why Diameter agent uses it own generated locally unique identifier
(Hop-by-Hop Identifier) to aid in matching requests/replies.

I know this is damn simple and but obvious, but some how I got confused while
discussing and explaining some of the Diameter protocol concepts to new team
members. As always, I turned to google for help but there was no answer.
Generally, if you are not getting an answer on google, you are asking a but
obvious question. The answer was hidden in the fine print, it is
Origin-Host-AVP+End-to-End-Identifier which is used for detecting duplicates and
not the End-to-End-Identifier alone. Anyway found the journey to reading the
fine print frustating, so thought of adding this to my blog to help someone like
me.  If you came to this being confused like me. Believe me you are not the
first one :).
