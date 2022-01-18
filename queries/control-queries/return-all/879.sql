select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,customer_demographics cd,item i
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 266 and ss.ss_hash <= 666 and c.c_hash >= 57 and c.c_hash <= 390 and i.i_hash >= 20 and i.i_hash <= 770
;
