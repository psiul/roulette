select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer_demographics cd,item i,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and sr.sr_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 24 and ss.ss_hash <= 424 and cd.cd_hash >= 211 and cd.cd_hash <= 544 and c.c_hash >= 136 and c.c_hash <= 886
;
