
/* Drop Tables */

DROP TABLE report_fks CASCADE CONSTRAINTS;
DROP TABLE Admin_tbl CASCADE CONSTRAINTS;
DROP TABLE chat_fks CASCADE CONSTRAINTS;
DROP TABLE chat CASCADE CONSTRAINTS;
DROP TABLE Community CASCADE CONSTRAINTS;
DROP TABLE game_fks CASCADE CONSTRAINTS;
DROP TABLE game CASCADE CONSTRAINTS;
DROP TABLE game_record CASCADE CONSTRAINTS;
DROP TABLE Location CASCADE CONSTRAINTS;
DROP TABLE Matching_fks CASCADE CONSTRAINTS;
DROP TABLE Matching CASCADE CONSTRAINTS;
DROP TABLE Member_tbl CASCADE CONSTRAINTS;
DROP TABLE report CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE Admin_tbl
(
	admin_id varchar2(20) NOT NULL,
	admin_password varchar2(30) NOT NULL,
	PRIMARY KEY (admin_id)
);



CREATE TABLE chat
(
	chat_id varchar2(20) NOT NULL,
	sender_member_id varchar2(20),
	content varchar2(600),
	chat_time date,
	receiver_member_id varchar2(20),
	PRIMARY KEY (chat_id)
);

create sequence chat_sequence start with 1;
commit;

select sender_member_id,content, 
substr(to_char(chat_time,'yyyymmddhhmi'),1,4)||'��'||
substr(to_char(chat_time,'yyyymmddhhmi'),5,2)||'��'||
substr(to_char(chat_time,'yyyymmddhhmi'),7,2)||'��'||
substr(to_char(chat_time,'yyyymmddhhmi'),9,2)||'��'||
substr(to_char(chat_time,'yyyymmddhhmi'),11,2)||'��'
from chat where (sender_member_id='member001' and receiver_member_id='member002') or (sender_member_id='member002' and receiver_member_id='member001') order by chat_id;

select * from chat  order by chat_id;

 --select * from chat where sender_member_id='member001' or receiver_member_id='member001' order by chat_id desc;

--select to_char(chat_time,'yyyy-mm-dd-hh-mi-ss') time  from chat order by time;

delete from chat_fks;
delete from chat;
commit;


CREATE TABLE chat_fks
(
	member_id varchar2(20) NOT NULL,
	chat_id varchar2(20) NOT NULL
);



CREATE TABLE Community
(
	community_id varchar2(20) NOT NULL,
	title varchar2(60),
	content varchar2(1000),
	create_at date,
	updated_at date,
	writer_id varchar2(20),
	question_type varchar2(1),
	member_id varchar2(20) NOT NULL,
	PRIMARY KEY (community_id)
);


CREATE TABLE game
(
	game_id varchar2(20) NOT NULL,
	game_name varchar2(30) NOT NULL,
	game_description varchar2(300) NOT NULL,
	game_image varchar2(600) NOT NULL,
	PRIMARY KEY (game_id)
);





CREATE TABLE game_record
(
	game_record_id varchar2(20) NOT NULL,
	game_id varchar2(20) NOT NULL,
	score varchar2(4) NOT NULL,
	record_time date NOT NULL,
	member_id varchar2(20) NOT NULL,
	PRIMARY KEY (game_record_id)
);

CREATE TABLE game_fks
(
	game_id varchar2(20) NOT NULL,
	game_record_id varchar2(20) NOT NULL
);


CREATE TABLE Location
(
	location_id varchar2(20) NOT NULL,
	latitude number(10,6) NOT NULL,
	longitude number(10,6) NOT NULL,
	address varchar2(300),
	member_id varchar2(20) NOT NULL,
	PRIMARY KEY (location_id, member_id)
);


CREATE TABLE Matching
(
	matching_id varchar2(20) NOT NULL,
	sender_member_id varchar2(20) NOT NULL,
	receiver_member_id varchar2(20) NOT NULL,
	matching_status varchar2(1),
	sender_status varchar2(1),
	receiver_status varchar2(1),
	PRIMARY KEY (matching_id)
);


CREATE TABLE Matching_fks
(
	member_id varchar2(20) NOT NULL,
	matching_id varchar2(20) NOT NULL
);


CREATE TABLE Member_tbl
(
	member_id varchar2(20) NOT NULL,
	mname varchar2(15) NOT NULL,
	email varchar2(30) NOT NULL,
	mpassword varchar2(18) NOT NULL,
	age number(3,0),
	gender varchar2(1) NOT NULL,
	phone varchar2(11) NOT NULL,
	introduce varchar2(300),
	grade varchar2(30) NOT NULL,
	mbti varchar2(4),
	religion varchar2(20),
	job varchar2(30),
	image varchar2(600) NOT NULL,
	height varchar2(3),
	weight varchar2(3),
	love_type varchar2(2),
	like_cnt varchar2(5) NOT NULL,
	game_point varchar2(10) NOT NULL,
	PRIMARY KEY (member_id)
);


CREATE TABLE report
(
	report_id varchar2(20) NOT NULL,
	reported_member_id varchar2(20) NOT NULL,
	reporting_member_id varchar2(20) NOT NULL,
	report_content varchar2(300),
	-- 
	-- 
	report_date date,
	PRIMARY KEY (report_id)
);


CREATE TABLE report_fks
(
	report_id varchar2(20) NOT NULL,
	admin_id varchar2(20) NOT NULL
);



/* Create Foreign Keys */

ALTER TABLE report_fks
	ADD FOREIGN KEY (admin_id)
	REFERENCES Admin_tbl (admin_id)
;


ALTER TABLE chat_fks
	ADD FOREIGN KEY (chat_id)
	REFERENCES chat (chat_id)
;


ALTER TABLE game_fks
	ADD FOREIGN KEY (game_id)
	REFERENCES game (game_id)
;


ALTER TABLE game_fks
	ADD FOREIGN KEY (game_record_id)
	REFERENCES game_record (game_record_id)
;


ALTER TABLE Matching_fks
	ADD FOREIGN KEY (matching_id)
	REFERENCES Matching (matching_id)
;


ALTER TABLE chat_fks
	ADD FOREIGN KEY (member_id)
	REFERENCES Member_tbl (member_id)
;


ALTER TABLE Community
	ADD FOREIGN KEY (member_id)
	REFERENCES Member_tbl (member_id)
;


ALTER TABLE game_record
	ADD FOREIGN KEY (member_id)
	REFERENCES Member_tbl (member_id)
;


ALTER TABLE Location
	ADD FOREIGN KEY (member_id)
	REFERENCES Member_tbl (member_id)
;


ALTER TABLE Matching_fks
	ADD FOREIGN KEY (member_id)
	REFERENCES Member_tbl (member_id)
;


ALTER TABLE report_fks
	ADD FOREIGN KEY (report_id)
	REFERENCES report (report_id)
;



/* Comments */

COMMENT ON COLUMN report.report_date IS '
';














INSERT INTO Admin_tbl VALUES ('admin1', 'password1');
INSERT INTO Admin_tbl VALUES ('admin2', 'password2');
INSERT INTO Admin_tbl VALUES('admin3', 'password3');
INSERT INTO Admin_tbl VALUES('admin4', 'password4');
INSERT INTO Admin_tbl VALUES('admin5', 'password5');
INSERT INTO Admin_tbl VALUES('admin6', 'password6');
INSERT INTO Admin_tbl VALUES('admin7', 'password7');
INSERT INTO Admin_tbl VALUES('admin8', 'password8');
INSERT INTO Admin_tbl VALUES('admin9', 'password9');
INSERT INTO Admin_tbl VALUES('admin10', 'password10');
INSERT INTO Admin_tbl VALUES('admin11', 'password11');
INSERT INTO Admin_tbl VALUES('admin12', 'password12');
INSERT INTO Admin_tbl VALUES('admin13', 'password13');
INSERT INTO Admin_tbl VALUES('admin14', 'password14');
INSERT INTO Admin_tbl VALUES('admin15', 'password15');
INSERT INTO Admin_tbl VALUES('admin16', 'password16');
INSERT INTO Admin_tbl VALUES('admin17', 'password17');
INSERT INTO Admin_tbl VALUES('admin18', 'password18');
INSERT INTO Admin_tbl VALUES('admin19', 'password19');
INSERT INTO Admin_tbl VALUES('admin20', 'password20');


INSERT INTO Member_tbl VALUES ('member001', '������', 'abc321@naver.com', '1234abcd', 27, 'M', '01012345678', '�ȳ��ϼ���. ���� �������Դϴ�.', '�Ϲ�ȸ��', 'ISTJ', '����', '������', '������1-1.jpg, ������2-2.png, ������3-3.png', '178', '72', 'a1', '100', '50000');
INSERT INTO Member_tbl VALUES ('member002', '�ڼ���', 'ajf123@gmail.com', 'abcd1234', 33, 'M', '01023456789', '�ȳ��ϼ���. �ڼ����Դϴ�.', '�Ϲ�ȸ��', 'ISFJ', 'õ�ֱ�', '�ڿ���', '�ڼ���1-1.png, �ڼ���2-2.png, �ڼ���3-3.png', '182', '80', 'c1', '300', '25000');

INSERT INTO Member_tbl VALUES ('member003', 'RM', 'dsaf432@gmail.com', 'qwerty123', 25, 'M', '01034567890', '�ȳ��ϼ���. RM�Դϴ�.', '�Ϲ�ȸ��', 'INFP', '�⵶��', '������', 'RM 1-1.png, RM 2-2.png, RM 3-3.png', '175', '70', 'b1', '357', '10000');

INSERT INTO Member_tbl VALUES ('member004', '�ں���', 'adffg753@naver.com', 'abcd1234', 29, 'M', '01045678901', '�ȳ��ϼ���. �ں����Դϴ�.', 'VIPȸ��', 'ENTJ', '�⵶��', '������', '�ں���1-1.png, �ں���2-2.png, �ں��� 3-3.jpg', '178', '75', 'a1', '200', '100000');

INSERT INTO Member_tbl VALUES ('member005', '���߱�', 'sfd837@gmail.com', 'qwer1234', 30, 'M', '01098765432', '�ȳ��ϼ���. ���� ���߱��Դϴ�.', '�Ϲ�ȸ��', 'ENFP', '�⵶��', '���л�', '���߱�1-1.jpg, ���߱�2-2.jpg ,���߱�3-3.jpg', '185', '80', 'd1', '120', '100000');

INSERT INTO Member_tbl VALUES ('member006', '����', 'htyr52342@gmail.com', 'abcd1234', 25, 'M', '01055556666', '�ȳ��ϼ���. ���� �����Դϴ�.', '�Ϲ�ȸ��', 'INFJ', 'õ�ֱ�', '������', '����1-1.jpg, ����2-2.jpg, ����3-3.png', '180', '75', 'e1', '50', '20000');

INSERT INTO Member_tbl VALUES ('member007', '�����', 'dfdfgds209@gmail.com', 'asdf5678', 33, 'M', '01011112222', '�ȳ��ϼ���. ���� ������Դϴ�.', '�Ϲ�ȸ��', 'INTP', '����', '�ڿ���', '�����1-1.jpg, �����2-2.jpg, �����3-3.png', '187', '70', 'b1', '80', '30000');

INSERT INTO Member_tbl VALUES ('member008', '������', 'qwxcx17364@naver.com', 'qazxswed', 28, 'M', '01033334444', '�ȳ��ϼ���. ���� �������Դϴ�.', '�Ϲ�ȸ��', 'ISFJ', 'õ�ֱ�', '���л�', '������1-1.png, ������2-2.png, ������3-3.png', '181', '77', 'a1', '150', '50000');
INSERT INTO Member_tbl VALUES ('member009', '������', 'sgfgfg1456@gmail.com', 'abcd1234', 35, 'M', '01055556666', '�ȳ��ϼ���. ���� �������Դϴ�.', 'VIP', 'ENTP', '����', '����', '������1-1.jpg, ������2-2.jpg, ������3-3.jpg', '180', '78', 'a1', '500', '80000');

select * from Member_tbl;




INSERT INTO Community VALUES ('c001', '������ ��ȭ ��õ', '������ ��ȭ�� �Ұ��ص帮�� �մϴ�. ���� ��õ�ϴ� ��ȭ�� ������ ����Դϴ�. �� ��ȭ�� ���ǰ� ���� ����ϴ� ��� �е鲲 ��õ�帮��, Ư�� �� ������ ������ ���� �ٴ� ������ ������ ���� �е��� �� �� �� ��û�غ��ñ� ��õ�帳�ϴ�!', '2023-05-12', '2023-05-12', 'writer123', 'M', 'member001');
INSERT INTO Community VALUES ('c002', '������ ���ο� ���� �Ұ�', '������ ���ο� ������ �Ұ��ص帮�� �մϴ�. �̹��� �Ұ��� ������ �� Į�����Դϴ�. �̰��� ��õ �޴��� Į������ �������ε���, �ѱ� ���������� ����� �Ծ�� ���� �е��� �� �湮�غ��ñ� ��õ�帳�ϴ�!','2023-05-11', '2023-05-11', 'writer456', 'M', 'member002');
INSERT INTO Community VALUES ('c003', '�Ϸ� �ϰ� �����ϱ�', '������ �Ϸ� �ϰ��� �����غ��� �մϴ�. ������ ��� �� ȸ�Ǹ� �����ϰ�, ������ ó���ϴ� �߰��߰� ��å�� �������ϴ�. ���Ŀ��� �߿��� ������Ʈ ��ǥ �ڷḦ �������ϰ�, ȸ�� ������ �Բ� ������ ������ �̾߱⸦ �������ϴ�. �Ϸ� ���� �ٻڰ� ���ϴ� ���� �ǰ�������, �ѵ��� �Ϸ翴���ϴ�!','2023-05-10', '2023-05-10', 'writer789', 'Q', 'member003');
INSERT INTO Community  VALUES ('c004', '��� ��õ���ּ���', '���� ���ο� ��̸� ã�� �־��. ��õ �� ���ּ���!', '2023-05-01', '2023-05-03', 'u001', 'H', 'member004');
INSERT INTO Community  VALUES ('c005', '��å ��� �ϼ���?', '��ҿ� ��å�� �����ؼ� ���� ��å�� �ٳ���µ�, �پ��� ��Ҹ� �˰� �;��. ��� ��å�� �Ͻó���?', '2023-04-25', '2023-04-28', 'u003', 'H', 'member005');
INSERT INTO Community  VALUES ('c006', '������ ���� ���� ������ ��õ', '������ ���� ���� ������ ��õ���ּ���!', '2023-04-15', '2023-04-16', 'u002', 'H', 'member006');
INSERT INTO Community  VALUES ('c007', '���α׷��� �ʺ��Դϴ�', '���α׷����� ��������� �մϴ�. � �� ���� ���� �������?', '2023-05-10', '2023-05-10', 'u004', 'H', 'member007');
INSERT INTO Community  VALUES ('c008', '���� ��� �󸶰� �����Ѱ���?', '���� ���̸� ���� ���� ���ܸ� �������� �ϴµ�, ����� �󸶰� �����Ѱ���?', '2023-05-07', '2023-05-08', 'u005', 'H', 'member008');
INSERT INTO Community  VALUES ('c009', '�� �ٹ̱� ��', '���� �ٹ̰� ������, ���� ������ �˷��ּ���!', '2023-04-20', '2023-04-20', 'u003', 'H', 'member009');






 
INSERT INTO game  VALUES('G00001', 'abc', 'dkjfdfsdfds', 'fassf');










INSERT INTO game_record VALUES ('GR00001', 'G00001', '100', '2023-05-10', 'member001'); 










INSERT INTO Location VALUES ('L00001', 37.5665, 126.9780, '����Ư���� ������ ���ﵿ', 'member001');
INSERT INTO Location VALUES ('L00002', 37.5665, 126.9780, '����Ư���� ���α� �λ絿', 'member002');
INSERT INTO Location VALUES ('L00003', 37.5665, 126.9780, '����Ư���� ������ ȫ���Ա�', 'member003');
INSERT INTO Location VALUES ('L00004', 37.5665, 126.9780, '����Ư���� ������ ȭ�', 'member004');
INSERT INTO Location VALUES ('L00005', 37.5665, 126.9780, '����Ư���� ���ı� ��ǵ�', 'member005');
INSERT INTO Location VALUES ('L00006', 37.5665, 126.9780, '����Ư���� ������ õȣ��', 'member006');
INSERT INTO Location VALUES ('L00007', 37.5665, 126.9780, '��⵵ ���ν� ���ﱸ', 'member007');
INSERT INTO Location VALUES ('L00008', 37.5665, 126.9780, '����Ư���� ���ϱ� �̾Ƶ�', 'member008');
INSERT INTO Location VALUES ('L00009', 37.5665, 126.9780, '����Ư���� �߱� ��', 'member009');




INSERT INTO Matching VALUES ('MT00001', 'sender1', 'receiver1', 'Y', 'Y', 'Y');
INSERT INTO Matching VALUES ('MT00002', 'sender2', 'receiver2', 'N', 'N', 'Y');
INSERT INTO Matching VALUES ('MT00003', 'sender3', 'receiver3', 'Y', 'Y', 'N');
INSERT INTO Matching VALUES ('MT00004', 'sender4', 'receiver4', 'W', 'Y', 'Y');
INSERT INTO Matching VALUES ('MT00005', 'sender5', 'receiver5', 'N', 'Y', 'N');
INSERT INTO Matching VALUES ('MT00006', 'sender6', 'receiver6', 'Y', 'N', 'Y');
INSERT INTO Matching VALUES ('MT00007', 'sender7', 'receiver7', 'N', 'N', 'Y');
INSERT INTO Matching VALUES ('MT00008', 'sender8', 'receiver8', 'Y', 'N', 'Y');
INSERT INTO Matching VALUES ('MT00009', 'sender9', 'receiver9', 'W', 'Y', 'N');
INSERT INTO Matching VALUES ('MT000010', 'sender10', 'receiver10', 'W', 'N', 'N');
INSERT INTO Matching VALUES ('MT000011', 'sender11', 'receiver11', 'Y', 'N', 'N');
INSERT INTO Matching VALUES ('MT000012', 'sender12', 'receiver12', 'N', 'Y', 'Y');
INSERT INTO Matching VALUES ('MT000013', 'sender13', 'receiver13', 'W', 'Y', 'Y');
INSERT INTO Matching VALUES ('MT000014', 'sender14', 'receiver14', 'Y', 'Y', 'N');
INSERT INTO Matching VALUES ('MT000015', 'sender15', 'receiver15', 'W', 'N', 'N');
INSERT INTO Matching VALUES ('MT000016', 'sender16', 'receiver16', 'W', 'Y', 'N');
INSERT INTO Matching VALUES ('MT000017', 'sender17', 'receiver17', 'Y', 'N', 'Y');
INSERT INTO Matching VALUES ('MT000018', 'sender18', 'receiver18', 'W', 'Y', 'Y');
INSERT INTO Matching VALUES ('MT000019', 'sender19', 'receiver19', 'W', 'N', 'Y');
INSERT INTO Matching VALUES ('MT000020', 'sender20', 'receiver20', 'N', 'N', 'N');











--INSERT INTO Member_tbl VALUES ('member010', '��', 'dfdar732@gmail.com', 'abcd1234', 28, 'M', '01066667777', '�ȳ��ϼ���. ���� ���Դϴ�.', '�Ϲ�ȸ��', 'ISFP', '�⵶��', '������', '��1-1.png, ��2-2.jpg, ��3-3.png', '179', '70', 'c1', '30', '10000');
--INSERT INTO Member_tbl VALUES ('member011', '������', 'asfdfsd162@gmail.com', 'abcd1234', 24, 'F', '01023456789', '�ȳ��ϼ���. �������Դϴ�.', '�Ϲ�ȸ��', 'ENFP', '�⵶��', '���л�', '������01, ������02, ������03', '160', '50', 'b2', '150', '20000');
--INSERT INTO Member_tbl VALUES ('member012', '�̿�', 'sfd6322@gmail.com', 'qwer5678', 31, 'F', '01034567890', '�ȳ��ϼ���. �̿��Դϴ�.', '�Ϲ�ȸ��', 'INTJ', '����', '������', '�̿�01, �̿�02, �̿�03', '171', '80', 'c2', '200', '30000');
--INSERT INTO Member_tbl VALUES ('member013', '�ں���', 'sgdgf122@gmail.com', 'asdf4321', 22, 'F', '01045678901', '�ȳ��ϼ���. �ں����Դϴ�.', '�Ϲ�ȸ��', 'ISFP', '����', '���л�', '�ں���01, �ں���02, �ں���03', '163', '50', 'a2', '50', '5000');
--INSERT INTO Member_tbl VALUES ('member014', '�糪', 'xvs533@gmail.com', 'zxcv0987', 29, 'F', '01056789012', '�ȳ��ϼ���. �糪�Դϴ�.', 'VIP', 'ENFJ', '����', '������', '�糪01, �糪02, �糪02', '176', '70', 'e2', '120', '10000', 'R00005');
--INSERT INTO Member_tbl VALUES ('member015', '������', 'sghc525@gmail.com', 'qazx7531', 25, 'F', '01067890123', '�ȳ��ϼ���. �������Դϴ�.', '�Ϲ�ȸ��', 'INFJ', '�⵶��', '������', '������01, ������02, ������03', '169', '55', 'a2', '90', '8000', 'R00006');
--INSERT INTO Member_tbl VALUES ('member016', '������', 'ibfg523@gmail.com', 'wsed9658', 28, 'F', '01078901234', '�ȳ��ϼ���. �������Դϴ�.', 'VIP', 'ISTP', '�⵶��', '������', '������01, ������02, ������03', '162', '57', 'a2', '80', '6000', 'R00007');
--INSERT INTO Member_tbl VALUES ('member017', 'ä��', 'hdd623@gmail.com', 'rtyu1592', 30, 'F', '01090123456', '�ȳ��ϼ���. ä���Դϴ�.', '�Ϲ�ȸ��', 'INTP', 'õ�ֱ�', '������', 'ä��01, ä��02, ä��03', '169', '60', 'b2', '110', '9000', 'R00009');
--INSERT INTO Member_tbl VALUES ('member018', 'ī����', 'hdd245@gmail.com', 'vbnm7531', 23, 'F', '01001234567', '�ȳ��ϼ���. ī�����Դϴ�.', '�Ϲ�ȸ��', 'ISFJ', '����', '���л�', 'ī����01, ī����02, ī����03', '170', '57', 'd2', '60', '3500', 'R00010');
--INSERT INTO Member_tbl VALUES ('member019', '�¿�', 'dhdg522@gmail.com', 'uiop4321', 27, 'F', '01034567890', '�ȳ��ϼ���. �¿��Դϴ�.', 'VIP', 'INFJ', '�ұ�', '������', '�¿�01, �¿�02, �¿�03', '165', '50', 'd2', '50', '5000', 'R00013');
--INSERT INTO Member_tbl VALUES ('member020', '����', 'mdjd652@gmail.com', 'zxcv9876', 22, 'F', '01045678901', '�ȳ��ϼ���. �����Դϴ�.', '�Ϲ�ȸ��', 'ISFP', 'õ�ֱ�', '���л�', '����01, ����02, ����03', '160', '50', 'a2', '120', '10000', 'R00014');





INSERT INTO report VALUES ('R00001', 'M00001', 'M00001', '�λ��� ���� ȸ���Դϴ�.', '2023-05-01');
INSERT INTO report VALUES ('R00002', 'M00002', 'M00003', '���ǹٸ��� ������ ���� ���̴� ȸ���Դϴ�.', '2023-05-02');
INSERT INTO report VALUES ('R00003', 'M00003', 'M00005', '���Ͻ� �� ���� ȸ���Դϴ�.', '2023-05-03');
INSERT INTO report VALUES ('R00004', 'M00004', 'M00007', '�����ʴϴ�.', '2023-05-04');
INSERT INTO report VALUES ('R00005', 'M00005', 'M00009', '�����̽ʴϴ�.', '2023-05-05');
INSERT INTO report VALUES ('R00006', 'M00006', 'M00011', '���ǹٸ��� ģ���� ȸ���Դϴ�.', '2023-05-06');
INSERT INTO report VALUES ('R00007', 'M00007', 'M00013', '�λ��� ���� ȸ���Դϴ�.', '2023-05-07');
INSERT INTO report VALUES ('R00008', 'M00008', 'M00015', 'ģ���Ͻ� �� ���ƿ�.', '2023-05-08');
INSERT INTO report VALUES ('R00009', 'M00009', 'M00017', '�ڽŰ��� ���� ���̽ʴϴ�.', '2023-05-09');
INSERT INTO report VALUES ('R00010', 'M00010', 'M00019', '�����ʴϴ�.', '2023-05-10');
INSERT INTO report VALUES ('R00011', 'M00011', 'M00002', '���� �λ��� �޾ҽ��ϴ�.', '2023/05/01');
INSERT INTO report VALUES ('R00012', 'M00012', 'M00018', '�ʹ� ģ���ϼż� ��� ���ҽ��ϴ�.','2023/05/02');
INSERT INTO report VALUES ('R00013', 'M00013', 'M00010', '�����Ͻ� �� �����ϴ�.', '2023/05/03');
INSERT INTO report VALUES ('R00014', 'M00014', 'M00004', '���� �λ��� �޾ҽ��ϴ�.', '2023/05/04');
INSERT INTO report VALUES ('R00015', 'M00015', 'M00006', '�ųʰ� ���Ƽ� ����� ���ҽ��ϴ�.', '2023/05/05');
INSERT INTO report VALUES ('R00016', 'M00016', 'M00020', '���Ͻ� �� ���� ȸ���Դϴ�.', '2023/05/06');
INSERT INTO report VALUES ('R00017', 'M00017', 'M00012', 'ģ���Ͻ� �� ���ƿ�.','2023-02-01');

INSERT INTO report VALUES ('R00018', 'M00018', 'M00013', '�λ��� �ʹ� ���� ���̽ʴϴ�.', '2023-03-15');

INSERT INTO report VALUES ('R00019', 'M00019', 'M00014', '�ڽŰ��� ���� ���̽ʴϴ�.', '2023-05-12');

INSERT INTO report VALUES ('R00020', 'M00020', 'M00015', '���� �λ��� �޾ҽ��ϴ�.', '2023-04-20');










INSERT INTO report_fks VALUES ('R00001', 'admin1');

INSERT INTO report_fks VALUES ('R00002', 'admin2');

INSERT INTO report_fks VALUES ('R00003', 'admin3');

INSERT INTO report_fks VALUES ('R00004', 'admin4');

INSERT INTO report_fks VALUES ('R00005', 'admin5');

INSERT INTO report_fks VALUES ('R00006', 'admin6');

INSERT INTO report_fks VALUES ('R00007', 'admin7');

INSERT INTO report_fks VALUES ('R00008', 'admin8');

INSERT INTO report_fks VALUES ('R00009', 'admin9');

INSERT INTO report_fks VALUES ('R00010', 'admin10');

INSERT INTO report_fks VALUES ('R00011', 'admin11');

INSERT INTO report_fks VALUES ('R00012', 'admin12');

INSERT INTO report_fks VALUES ('R00013', 'admin13');

INSERT INTO report_fks VALUES ('R00014', 'admin14');

INSERT INTO report_fks VALUES ('R00015', 'admin15');

INSERT INTO report_fks VALUES ('R00016', 'admin16');

INSERT INTO report_fks VALUES ('R00017', 'admin17');

INSERT INTO report_fks VALUES ('R00018', 'admin18');

INSERT INTO report_fks VALUES ('R00019', 'admin19');

INSERT INTO report_fks VALUES ('R00020', 'admin20');


INSERT INTO chat_fks VALUES ('member001', 'chat1');
INSERT INTO chat_fks VALUES ('member002', 'chat2');
INSERT INTO chat_fks VALUES ('member003', 'chat1');
INSERT INTO chat_fks VALUES ('member004', 'chat3');
INSERT INTO chat_fks VALUES ('member005', 'chat2');
INSERT INTO chat_fks VALUES ('member006', 'chat4');
INSERT INTO chat_fks VALUES ('member007', 'chat3');
INSERT INTO chat_fks VALUES ('member008', 'chat5');
INSERT INTO chat_fks VALUES ('member009', 'chat4');




INSERT INTO game_fks VALUES ('G00001', 'GR00001');




INSERT INTO Matching_fks VALUES ('member001', 'MT00001');
INSERT INTO Matching_fks VALUES ('member002', 'MT00002');
INSERT INTO Matching_fks VALUES ('member003', 'MT00003');
INSERT INTO Matching_fks VALUES ('member004', 'MT00004');
INSERT INTO Matching_fks VALUES ('member005', 'MT00005');
INSERT INTO Matching_fks VALUES ('member006', 'MT00006');
INSERT INTO Matching_fks VALUES ('member007', 'MT00007');
INSERT INTO Matching_fks VALUES ('member008', 'MT00008');
INSERT INTO Matching_fks VALUES ('member009', 'MT00009');

commit;
