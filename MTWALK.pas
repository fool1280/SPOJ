const fi='';
      fo='';
var f,g:text;
    a:array[1..100,1..100] of longint;
    kt:array[1..100,1..100] of boolean;
    d:array[1..4] of smallint=(0,0,1,-1);
    c:array[1..4] of smallint=(1,-1,0,0);
    n,max,min:longint;
    mark:boolean;
procedure Doc;
var i,j:longint;
begin
        assign(f,fi);
        reset(f);
        readln(f,n);
        max:=0;
        min:=110;
        for i:=1 to n do
        for j:=1 to n do
        begin
                read(f,a[i,j]);
                if a[i,j]>max then max:=a[i,j];
                if a[i,j]<min then min:=a[i,j];
        end;
        close(f);
end;
procedure DFS(l,r,x,y:longint);
var u,v,k:longint;
begin
        if mark=true then exit;
        kt[x,y]:=false;
        if (x=n) and (y=n) then mark:=true;
        for k:=1 to 4 do
        begin
                u:=x+d[k];
                v:=y+c[k];
                if (u>0) and (v>0) and (u<=n) and (v<=n) and (kt[u,v]) and (a[u,v]>=l) and (a[u,v]<=r) then DFS(l,r,u,v);
        end;
end;
function KiemTra(x:longint):boolean;
var i,l,r:longint;
begin
        for i:=min to max-x do
        begin
                l:=i;
                r:=i+x;
                fillchar(kt,sizeof(kt),true);
                mark:=false;
                if (a[1,1]>=l) and (a[1,1]<=r) then DFS(l,r,1,1);
                if mark=true then exit(true);
        end;
        exit(false);
end;
procedure XuLi;
var l,r,mid,kq,i:longint;
begin
        l:=0;
        r:=max-min;
        while (l<=r) do
        begin
                mid:=(r+l) div 2;
                if KiemTra(mid) then
                begin
                        kq:=mid;
                        r:=mid-1;
                end else l:=mid+1;
        end;
        assign(g,fo);
        rewrite(g);
        writeln(g,kq);
        close(g);
end;
begin
        Doc;
        XuLi;
end.
