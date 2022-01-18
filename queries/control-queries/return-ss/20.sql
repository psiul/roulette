select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,customer_demographics cd,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 147 and ss.ss_hash <= 547 and i.i_hash >= 334 and i.i_hash <= 667 and c.c_hash >= 32 and c.c_hash <= 782
;
