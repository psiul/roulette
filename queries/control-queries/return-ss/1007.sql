select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer_demographics cd,customer c,item i
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and sr.sr_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 86 and cd.cd_hash <= 486 and c.c_hash >= 96 and c.c_hash <= 429 and i.i_hash >= 167 and i.i_hash <= 917
;
