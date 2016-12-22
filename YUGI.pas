const fi='';
      fo='';
var f,g:text;
    a:array[1..200,1..200] of longint;
    b:array[1..200,1..200] of boolean;
    free:array[1..200] of boolean;
    n,k:longint;
procedure Doc;
var i,j:longint;
begin
        assign(f,fi);
        reset(f);
        readln(f,n,k);
        for i:=1 to n do
        for j:=1 to n do read(f,a[i,j]);
        close(f);
end;
procedure DFS(i:longint);
var j:integer;
begin
        free[i]:=false;
        for j:=1 to n do if (free[j]) and (b[i,j]=false) then DFS(j);
end;
function KiemTra(x:longint):longint;
var i,j,d:integer;
begin
        fillchar(b,sizeof(b),true);
        for i:=1 to n-1 do
        begin
                for j:=i+1 to n do
                begin
                        if a[i,j]<x then
                        begin
                                b[i,j]:=false;
                                b[j,i]:=false;
                        end;
                end;
        end;
        fillchar(free,sizeof(free),true);
        d:=0;
        for i:=1 to n do
        begin
                if free[i] then
                begin
                        inc(d);
                        dfs(i);
                end;
        end;
        exit(d);
end;
procedure Search;
var l,r,mid,kq:longint;
begin
        l:=0;
        r:=maxlongint;
        while l<=r do
        begin
                mid:=(l+r) div 2;
                if KiemTra(mid)>=k then
                begin
                        kq:=mid;
                        l:=mid+1;
                end
                else r:=mid-1;
        end;
        assign(g,fo);
        rewrite(g);
        writeln(g,kq);
        close(g);
end;
begin
        Doc;
        Search;
end.