select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,customer_demographics cd,item i
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and sr.sr_item_sk = i.i_item_sk and c.c_hash >= 191 and c.c_hash <= 591 and cd.cd_hash >= 201 and cd.cd_hash <= 951 and i.i_hash >= 344 and i.i_hash <= 677
;
