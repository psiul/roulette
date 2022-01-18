select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,store_returns sr,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and ss.ss_hash >= 213 and ss.ss_hash <= 963 and c.c_hash >= 422 and c.c_hash <= 822 and i.i_hash >= 83 and i.i_hash <= 416
;
