select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,item i,customer_demographics cd
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and sr.sr_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 287 and ss.ss_hash <= 620 and c.c_hash >= 354 and c.c_hash <= 754 and cd.cd_hash >= 124 and cd.cd_hash <= 874
;
