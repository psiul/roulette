select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,store_returns sr,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and i.i_hash >= 103 and i.i_hash <= 853 and cd.cd_hash >= 38 and cd.cd_hash <= 371 and c.c_hash >= 305 and c.c_hash <= 705
;
