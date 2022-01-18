select count(ss.ss_item_sk)
from store_sales ss,item i,store_returns sr,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 250 and ss.ss_hash <= 583 and i.i_hash >= 23 and i.i_hash <= 423 and cd.cd_hash >= 117 and cd.cd_hash <= 867
;
