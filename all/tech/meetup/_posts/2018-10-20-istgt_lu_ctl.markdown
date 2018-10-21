Date: 2018-10-20
Title: Meetup: Hacktoberfest - iSCSI Target Pull Request

I completely forgot about my 6-month old daughter half-birthday and went to the
Hacktoberfest. I eventually remembered the birthday and we did a small
celebration, but this post is about hacktoberfest 2018. So let us talk about the
same.

The meeting was at the Eastland Citadel building on Hosur Main Road. It is just
at the fork where the Hosur Road fork into two road. One fork goes to the dairy
circle, the other fork becomes Adugodi Main Rd. It is a 8 storey building. The
meeting was on the first floor. You got your card on the ground floor and then
go to the first floor.

I wanted to pick an issue and somehow I ended up picking [ISCSI Target Refactor
Issue] (https://github.com/openebs/openebs/issues/2128). I do wanted to do some
Go code, but as fate wanted me to do C.

The issue was raised by Payes which I actually got a chance to talk with. Payes
wanted the code to be refactored to make it more maintainable. Payes wanted the
function to be split to smaller functions. The [Better Maintainable
Code] (http://shop.oreilly.com/product/0636920049159.do) book recommends "Write
Simple Units of Code" as a guideline and that is what Payes was suggesting.

I tried to refactor the code and as part of that realized that it is better to
leave that code as it rather than trying to refactor it.

# Guideline: Write Simple Units of Code

- Limit the number of branch points per unit to 4
- Do this by splitting complex units into simpler ones and avoid complex units
altogether
- This improves maintainability because keeping the number of branch points low
makes units easy to modify and test

A branch point is a statement where execution can take more than one direction
depending on a condition. This is also known as cyclomatic complexity.

At home, I got a chance to read the book.

# What is istgt

ISCSI Target. See https://github.com/elastocloud/istgt for more information.
Where ISCSI stands for Internet Small Computer System Interface. iSCSI is a
protocol which lets you connect with host storage remotely. iSCSI works by
sending SCSI data over TCP/IP.

The function `istgt_uctl_cmd_maxtime` was to be refactored.

# Abbrevations used in the code

- LUN: Logical Unit Number
- IQN: ISCSI Qualified Name
