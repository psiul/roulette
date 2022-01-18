select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer_demographics cd,customer c,item i
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and sr.sr_customer_sk = c.c_customer_sk and sr.sr_item_sk = i.i_item_sk and ss.ss_hash >= 361 and ss.ss_hash <= 761 and cd.cd_hash >= 236 and cd.cd_hash <= 569 and i.i_hash >= 146 and i.i_hash <= 896
;
