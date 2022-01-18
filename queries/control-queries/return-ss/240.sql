select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer_demographics cd,item i,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and sr.sr_item_sk = i.i_item_sk and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hash >= 89 and ss.ss_hash <= 839 and cd.cd_hash >= 552 and cd.cd_hash <= 952 and i.i_hash >= 420 and i.i_hash <= 753
;
