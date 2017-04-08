#!/usr/bin/perl
use LWP::UserAgent;
use HTTP::Request;

if($#ARGV == 0)
{
 $url = "http://www.yougetsignal.com/tools/web-sites-on-web-server/php/get-web-sites-on-web-server-json-data.php";
 $query = "remoteAddress=".$ARGV[0]."&key=";
 $ua = LWP::UserAgent->new;
 $ua->agent("Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1");
 $req = HTTP::Request->new(POST => $url);
 $req->content_type('application/x-www-form-urlencoded');
 $req->content($query);
 $response = $ua->request($req);
 $content = $response->content();
 $content=~ s/(status|Success|resultsMethod|database|lastScrape|remoteAddress|remoteIpAddress|domainCount|"")//g;
 @valores=$content=~ /"(.*?)"/g;
 $val=0;    
 foreach(@valores)
 {
  if($val==1)
  {
   print $_."\n";
  }
  if($_ eq "domainArray"){$val=1;}
 } 
}
else
{
 print "\nUsage: perl $0 domain ";
}