var mime_samples = [
  { 'mime': 'application/xhtml+xml', 'samples': [
    { 'url': 'http://www.mysite.com/', 'dir': '_m0/0', 'linked': 2, 'len': 20634 },
    { 'url': 'http://www.mysite.com/%20%20/.htaccess.aspx--\x3e\x22\x3e\x27\x3e\x27\x22\x3csfi000013v753013\x3e', 'dir': '_m0/1', 'linked': 2, 'len': 11983 },
    { 'url': 'http://www.mysite.com/blogs/', 'dir': '_m0/2', 'linked': 2, 'len': 16557 },
    { 'url': 'http://www.mysite.com/blogs/advancedfeatures-css.htm', 'dir': '_m0/3', 'linked': 1, 'len': 20926 },
    { 'url': 'http://www.mysite.com/blogs/advancedfeatures-syndication.htm', 'dir': '_m0/4', 'linked': 2, 'len': 21450 },
    { 'url': 'http://www.mysite.com/blogs/akismetspamprotection.htm', 'dir': '_m0/5', 'linked': 1, 'len': 21004 },
    { 'url': 'http://www.mysite.com/blogs/features-archiving.htm', 'dir': '_m0/6', 'linked': 1, 'len': 21299 },
    { 'url': 'http://www.mysite.com/business-web-hosting/', 'dir': '_m0/7', 'linked': 2, 'len': 12827 },
    { 'url': 'http://www.mysite.com/e-commerce/', 'dir': '_m0/8', 'linked': 2, 'len': 17054 },
    { 'url': 'http://www.mysite.com/email/', 'dir': '_m0/9', 'linked': 2, 'len': 14423 },
    { 'url': 'http://www.mysite.com/hosting/', 'dir': '_m0/10', 'linked': 2, 'len': 25588 },
    { 'url': 'http://www.mysite.com/vps-hosting/', 'dir': '_m0/11', 'linked': 2, 'len': 14991 },
    { 'url': 'http://www.mysite.com/sitemap.htm', 'dir': '_m0/12', 'linked': 2, 'len': 34424 } ]
  },
  { 'mime': 'text/css', 'samples': [
    { 'url': 'http://www.mysite.com/blogs/pagestyles.css', 'dir': '_m1/0', 'linked': 2, 'len': 1717 } ]
  }
];

var issue_samples = [
  { 'severity': 3, 'type': 40304, 'samples': [
    { 'url': 'http://www.mysite.com/%20%20/.htaccess.aspx--\x3e\x22\x3e\x27\x3e\x27\x22\x3csfi000013v753013\x3e', 'extra': '', 'dir': '_i0/0' },
    { 'url': 'http://www.mysite.com/%20%20/blogs/.htaccess.aspx--\x3e\x22\x3e\x27\x3e\x27\x22\x3csfi000005v753013\x3e', 'extra': '', 'dir': '_i0/1' },
    { 'url': 'http://www.mysite.com/%20%20/email/.htaccess.aspx--\x3e\x22\x3e\x27\x3e\x27\x22\x3csfi000003v753013\x3e', 'extra': '', 'dir': '_i0/2' },
    { 'url': 'http://www.mysite.com/%20%20/websitehosting/.htaccess.aspx--\x3e\x22\x3e\x27\x3e\x27\x22\x3csfi000007v753013\x3e', 'extra': '', 'dir': '_i0/3' },
    { 'url': 'http://www.mysite.com/blogs/pagestyles.css/.htaccess.aspx--\x3e\x22\x3e\x27\x3e\x27\x22\x3csfi000011v753013\x3e', 'extra': '', 'dir': '_i0/4' },
    { 'url': 'http://www.mysite.com/error/.htaccess.aspx--\x3e\x22\x3e\x27\x3e\x27\x22\x3csfi000001v753013\x3e', 'extra': '', 'dir': '_i0/5' },
    { 'url': 'http://www.mysite.com/sitemap.htm/skipfish:%2F%2Finvalid%2F%3B%3F', 'extra': '', 'dir': '_i0/6' } ]
  },
  { 'severity': 3, 'type': 40101, 'samples': [
    { 'url': 'http://www.mysite.com/%20%20/--\x3e\x22\x3e\x27\x3e\x27\x22\x3csfi000012v753013\x3e', 'extra': 'injected \x27\x3csfi...\x3e\x27 tag seen in HTML', 'dir': '_i1/0' },
    { 'url': 'http://www.mysite.com/%20%20/blogs/--\x3e\x22\x3e\x27\x3e\x27\x22\x3csfi000004v753013\x3e', 'extra': 'injected \x27\x3csfi...\x3e\x27 tag seen in HTML', 'dir': '_i1/1' },
    { 'url': 'http://www.mysite.com/%20%20/email/--\x3e\x22\x3e\x27\x3e\x27\x22\x3csfi000002v753013\x3e', 'extra': 'injected \x27\x3csfi...\x3e\x27 tag seen in HTML', 'dir': '_i1/2' },
    { 'url': 'http://www.mysite.com/%20%20/websitehosting/--\x3e\x22\x3e\x27\x3e\x27\x22\x3csfi000006v753013\x3e', 'extra': 'injected \x27\x3csfi...\x3e\x27 tag seen in HTML', 'dir': '_i1/3' },
    { 'url': 'http://www.mysite.com/blogs/pagestyles.css/--\x3e\x22\x3e\x27\x3e\x27\x22\x3csfi000010v753013\x3e', 'extra': 'injected \x27\x3csfi...\x3e\x27 tag seen in HTML', 'dir': '_i1/4' },
    { 'url': 'http://www.mysite.com/error/--\x3e\x22\x3e\x27\x3e\x27\x22\x3csfi000000v753013\x3e', 'extra': 'injected \x27\x3csfi...\x3e\x27 tag seen in HTML', 'dir': '_i1/5' } ]
  },
  { 'severity': 2, 'type': 30501, 'samples': [
    { 'url': 'http://www.mysite.com/', 'extra': 'http://www.communityarchitect.com/fs_img/footer/spacer.gif', 'dir': '_i2/0' },
    { 'url': 'http://www.mysite.com/blogs/', 'extra': 'http://www.communityarchitect.com/fs_img/footer/spacer.gif', 'dir': '_i2/1' },
    { 'url': 'http://www.mysite.com/blogs/advancedfeatures-css.htm', 'extra': 'http://www.communityarchitect.com/fs_img/footer/spacer.gif', 'dir': '_i2/2' },
    { 'url': 'http://www.mysite.com/blogs/advancedfeatures-syndication.htm', 'extra': 'http://www.communityarchitect.com/fs_img/footer/spacer.gif', 'dir': '_i2/3' },
    { 'url': 'http://www.mysite.com/blogs/akismetspamprotection.htm', 'extra': 'http://www.communityarchitect.com/fs_img/footer/spacer.gif', 'dir': '_i2/4' },
    { 'url': 'http://www.mysite.com/blogs/features-archiving.htm', 'extra': 'http://www.communityarchitect.com/fs_img/footer/spacer.gif', 'dir': '_i2/5' },
    { 'url': 'http://www.mysite.com/business-web-hosting/', 'extra': 'http://www.communityarchitect.com/fs_img/footer/spacer.gif', 'dir': '_i2/6' },
    { 'url': 'http://www.mysite.com/e-commerce/', 'extra': 'http://www.communityarchitect.com/fs_img/footer/spacer.gif', 'dir': '_i2/7' },
    { 'url': 'http://www.mysite.com/email/', 'extra': 'http://www.communityarchitect.com/fs_img/footer/spacer.gif', 'dir': '_i2/8' },
    { 'url': 'http://www.mysite.com/hosting/', 'extra': 'http://www.communityarchitect.com/fs_img/footer/spacer.gif', 'dir': '_i2/9' },
    { 'url': 'http://www.mysite.com/vps-hosting/', 'extra': 'http://www.communityarchitect.com/fs_img/footer/spacer.gif', 'dir': '_i2/10' },
    { 'url': 'http://www.mysite.com/sitemap.htm', 'extra': 'http://www.communityarchitect.com/fs_img/footer/spacer.gif', 'dir': '_i2/11' } ]
  },
  { 'severity': 0, 'type': 10803, 'samples': [
    { 'url': 'http://www.mysite.com/', 'extra': '', 'dir': '_i3/0' },
    { 'url': 'http://www.mysite.com/blogs/', 'extra': '', 'dir': '_i3/1' },
    { 'url': 'http://www.mysite.com/blogs/pagestyles.css', 'extra': '', 'dir': '_i3/2' },
    { 'url': 'http://www.mysite.com/blogs/advancedfeatures-css.htm', 'extra': '', 'dir': '_i3/3' },
    { 'url': 'http://www.mysite.com/blogs/advancedfeatures-syndication.htm', 'extra': '', 'dir': '_i3/4' },
    { 'url': 'http://www.mysite.com/blogs/akismetspamprotection.htm', 'extra': '', 'dir': '_i3/5' },
    { 'url': 'http://www.mysite.com/blogs/features-archiving.htm', 'extra': '', 'dir': '_i3/6' },
    { 'url': 'http://www.mysite.com/business-web-hosting/', 'extra': '', 'dir': '_i3/7' },
    { 'url': 'http://www.mysite.com/e-commerce/', 'extra': '', 'dir': '_i3/8' },
    { 'url': 'http://www.mysite.com/email/', 'extra': '', 'dir': '_i3/9' },
    { 'url': 'http://www.mysite.com/hosting/', 'extra': '', 'dir': '_i3/10' },
    { 'url': 'http://www.mysite.com/vps-hosting/', 'extra': '', 'dir': '_i3/11' },
    { 'url': 'http://www.mysite.com/sitemap.htm', 'extra': '', 'dir': '_i3/12' } ]
  },
  { 'severity': 0, 'type': 10205, 'samples': [
    { 'url': 'http://www.mysite.com/sfi9876', 'extra': '', 'dir': '_i4/0' } ]
  },
  { 'severity': 0, 'type': 10202, 'samples': [
    { 'url': 'http://www.mysite.com/', 'extra': '.V05 Apache', 'dir': '_i5/0' } ]
  }
];

