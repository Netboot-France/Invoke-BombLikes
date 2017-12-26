function Bomb-Likes{
    <#
    .SYNOPSIS  
        This is probably the most nonesense thing you can do
        with Powershell. LIke a friend's every single post in 
        facebook.

    .HOW-TO
        Login to Facebook using Internet explorer and run the command. This doesn't do authentication so you need to login first. 
        Things run at the background ($ie.Visible = $false) so you won't see things in action. Set it to True if you'd like 
        IE to pop up doing the automation. 

    .PARAMETER ProfileURL
        Facebook URL who you'd like to flood with likes (Or someone you'd like to grabe the attention) :D

    .PARAMETER Count
        Number of likes you'd like to click

    .PARAMETER Interval
        minimum seconds of wait between each likes.

    .EXAMPLE
        Invoke-BombLikes -ProfileURL https://www.facebook.com/Profil -Count 100 -Interval 5

    #>
    param(
    [Parameter(Mandatory = $true)]
    [String]$ProfileURL,
    [Parameter(Mandatory = $true)]
    [Int]$count,
    [Int]$Interval = 5
    
    )

    write-host "Opening Facebook Profile URL"
    $ie = New-Object -ComObject "InternetExplorer.application"
    $ie.Visible = $false
    $ie.Navigate("$ProfileURL")

    while ($ie.Busy -eq $true){

        # Wait for the page to load
        Start-Sleep -seconds 5;

    }


        $start = Get-Date;
        $VerticalScroll = 0

        Write-Host "Scrolling down for more likables"
        While((Get-Date) -lt $($start + [timespan]::new(0,0,$count))) {

            $ie.Document.parentWindow.scrollTo(0,$VerticalScroll)
            $VerticalScroll = $VerticalScroll + 100
        }

        Write-Host "Scroll done"


        $likes = $ie.Document.IHTMLDocument3_getElementsByTagName('a') | ? {$_.classname -eq "UFILikeLink _4x9- _4x9_ _48-k"}
        $like_count = $likes.Length
    
   
   $counter = 0
   

    Write-Host "Now the fun part, the liking!"

    foreach($item in $likes[0..$count]){
        $counter++;
        $item.click();
        Write-Progress -Activity "Liking Posts.." -CurrentOperation $item -PercentComplete (($counter / $likes[0..$count].count) * 100);
        sleep (get-random  -Minimum $Interval -Maximum ($Interval + 10))
    
    }

    write-host "Hahahah! Done!"

 }

