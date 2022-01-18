select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer_demographics cd,customer c,item i
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and sr.sr_customer_sk = c.c_customer_sk and sr.sr_item_sk = i.i_item_sk and ss.ss_hash >= 219 and ss.ss_hash <= 552 and c.c_hash >= 544 and c.c_hash <= 944 and i.i_hash >= 127 and i.i_hash <= 877
;
