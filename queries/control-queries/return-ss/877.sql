select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,item i,customer_demographics cd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 45 and ss.ss_hash <= 445 and i.i_hash >= 391 and i.i_hash <= 724 and cd.cd_hash >= 153 and cd.cd_hash <= 903
;
