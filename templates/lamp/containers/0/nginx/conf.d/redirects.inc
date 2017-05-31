location ~* "^/(tr|en)/mobile" {
    return 302 /;
}
#location ~* ^/tr/sportsbook { return 302 '/#prematch'; }
#location ~* ^/en/sportsbook { return 302 '/en#prematch'; }

location ~* ^/tr/en-populer   { return 302 /tr/casino; }
location ~* ^/tr/in-play      { return 302 '/#live'; }
location ~* ^/tr/canli-casino { return 302 /tr/casino; }
location ~* ^/tr/lottery      { return 302 /; }
location ~* ^/tr/sartlar-ve-kosullar      { return 302 /; }
location ~* ^/tr/bonuslar { return 302 /tr/bonuses; }

#location ~* ^/en/sportsbook { return 302 '/en#prematch'; }
location ~* ^/en/in-play { return 302 '/en/sportsbook#live'; }
location ~* ^/en/most-popular { return 302 /en/casino; }
#location ~* ^/en/faq { return 302 /; }
location ~* ^/en/join { return 302 /; }
location ~* ^/en/sport-rules { return 302 /; }
#location ~* ^/en/terms-and-conditions { return 302 /; }
location ~* ^/en/lottery { return 302 /; }
#location ~* ^/en/about { return 302 /; }
location ~* ^/en/virtual-sports { return 302 /; }
location ~* ^/en/slots { return 302 /en/casino/slots; }

location ~* ^/en/player/passwordreset { return 302 /en/forgotPassword;}
