select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,store_returns sr,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 123 and ss.ss_hash <= 873 and i.i_hash >= 485 and i.i_hash <= 818 and c.c_hash >= 67 and c.c_hash <= 467
;
