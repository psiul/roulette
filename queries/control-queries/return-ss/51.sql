select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,store_returns sr,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 641 and cd.cd_hash <= 974 and c.c_hash >= 77 and c.c_hash <= 827 and i.i_hash >= 268 and i.i_hash <= 668
;
