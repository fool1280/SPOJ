const fi='';
      fo='';
var f,g:text;
    a:array[2..200000] of longint;
    d,c:longint;
procedure Doc;
begin
        assign(f,fi);
        fillchar(a,sizeof(a),0);
        reset(f);
        read(f,d,c);
        close(f);
end;
procedure Prime;
var i,j:longint;
begin
        assign(g,fo);
        rewrite(g);
        for i:=2 to c do
        begin
                if a[i]=0 then
                begin
                        for j:=i to (c div i) do a[i*j]:=1;
                        if (i>=d) and (i<=c) then writeln(g,i);
                end;
        end;
        close(g);
end;
begin
        Doc;
        Prime;
end.
