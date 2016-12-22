const fi='';
      fo='';
var f,g:text;
    k,h,temp:qword;
procedure Doc;
begin
        assign(f,fi);
        reset(f);
        read(f,k,h);
        close(f);
end;
procedure XuLi;
var st,x:string;
    t:longint;
begin
        st:='';
        repeat
                t:=k mod 2;
                Str(t,x);
                st:=x+st;
                k:=k div 2;
        until k=0;
        assign(g,fo);
        rewrite(g);
        write(g,st);
        close(g);
end;
begin
        Doc;
        XuLi;
end.
