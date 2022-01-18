select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,customer c,customer_demographics cd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and sr.sr_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 636 and i.i_hash <= 969 and c.c_hash >= 98 and c.c_hash <= 848 and cd.cd_hash >= 85 and cd.cd_hash <= 485
;
