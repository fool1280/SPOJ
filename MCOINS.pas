const fi='';
      fo='';
      maxn=1000000;
var f,g:text;
    kq:array[0..1000000] of boolean;
    k,l,m,n:longint;
procedure Init;
var i:longint;
begin
        fillchar(kq,sizeof(kq),true);
        kq[0]:=false;
        for i:=1 to maxn  do
        begin
                if i>=l then
                begin
                        if (kq[i-1]=true) and (kq[i-l]=true) and (kq[i-k]=true) then kq[i]:=false;
                end
                else
                if i>=k then
                begin
                        if (kq[i-1]=true) and (kq[i-k]=true) then kq[i]:=false;
                end
                else if kq[i-1]=true then kq[i]:=false;
        end;
end;
procedure Doc;
var i:longint;
begin
        assign(f,fi);
        reset(f);
        readln(f,k,l,m);
        Init;
        assign(g,fo);
        rewrite(g);
        for i:=1 to m do
        begin
                read(f,n);
                if kq[n]=true then write(g,'A') else write(g,'B');
        end;
        close(g);
        close(f);
end;
begin
        Doc;
end.
