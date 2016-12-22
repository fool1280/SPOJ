const fi='';
      fo='';
var f,g:text;
    a:array[1..1000,1..1000] of longint;
    h,l,r:array[0..1001] of longint;
    n,m:longint;
procedure Doc;
var i,j:longint;
begin
        assign(f,fi);
        reset(f);
        readln(f,m,n);
        for i:=1 to m do
        begin
                for j:=1 to n do
                begin
                        read(f,a[i,j]);
                end;
        end;
        close(f);
end;
function max(a,b:longint):longint;
begin
        if a>b then exit(a) else exit(b);
end;
procedure Solve;
var i,j,res:longint;
begin
        fillchar(h,sizeof(h),0);
        fillchar(l,sizeof(l),0);
        fillchar(r,sizeof(r),0);
        h[0]:=-1;
        h[n+1]:=-1;
        res:=0;
        for i:=1 to m do
        begin
                for j:=1 to n do h[j]:=a[i,j]*(h[j]+1);
                for j:=1 to n do
                begin
                        l[j]:=j;
                        while h[l[j]-1]>=h[j] do
                        begin
                                l[j]:=l[l[j]-1];
                        end;
                end;
                for j:=n downto 1 do
                begin
                        r[j]:=j;
                        while h[r[j]+1]>=h[j] do
                        begin
                                r[j]:=r[r[j]+1];
                        end;
                end;
                for j:=1 to n do
                begin
                        if h[j]*(r[j]-l[j]+1)>res then
                        begin
                                res:=h[j]*(r[j]-l[j]+1);
                        end;
                end;
        end;
        assign(g,fo);
        rewrite(g);
        writeln(g,res);
        close(g);
end;
begin
        Doc;
        Solve;
end.
