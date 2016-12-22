const fi='';
      fo='';
var f,g:text;
    root:array[1..10000] of longint;
    x,y,p,c:longint;
function FindRoot(x:longint):longint;
var i:longint;
begin
        i:=x;
        while (root[i]>0) do i:=root[i];
        exit(i);
end;
procedure Unite(r1,r2:longint);
var x:longint;
begin
        x:=root[r1]+root[r2];
        if root[r1]<root[r2] then
        begin
                root[r2]:=r1;
                root[r1]:=x;
        end
        else
        begin
                root[r1]:=r2;
                root[r2]:=x;
        end;
end;
procedure Doc;
var i,r1,r2:longint;
begin
        assign(f,fi);
        reset(f);
        for i:=1 to 10000 do root[i]:=-1;
        read(f,p);
        assign(g,fo);
        rewrite(g);
        for i:=1 to p do
        begin
                read(f,x,y,c);
                if c=1 then
                begin
                        r1:=FindRoot(x);
                        r2:=FindRoot(y);
                        if r1<>r2 then Unite(r1,r2);
                end
                else
                begin
                        r1:=FindRoot(x);
                        r2:=FindRoot(y);
                        if r1<>r2 then writeln(g,0) else writeln(g,1);
                end;
        end;
        close(g);
        close(f);
end;
begin
        Doc;
end.