select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i,store_returns sr
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and c.c_hash >= 194 and c.c_hash <= 944 and cd.cd_hash >= 236 and cd.cd_hash <= 636 and i.i_hash >= 91 and i.i_hash <= 424
;
