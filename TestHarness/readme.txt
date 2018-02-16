the TestHarness project was an idea i had to do a quick and easy regression test for our Medicaid project


TestHarness_mergo.ergo is the final product.  It accepts too payloads, Pre and post, then a query will identify all difference that actually matter.

import testharness_merge.ergo, import testinpost.xml and testthinpre.xml and query:

compare(?iteration, ?instance, ?entityType, ?publicName, ?attrValue, ?itterationOne, ?itterationTwo )