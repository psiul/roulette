select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,store_returns sr,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 187 and ss.ss_hash <= 520 and i.i_hash >= 64 and i.i_hash <= 814 and cd.cd_hash >= 120 and cd.cd_hash <= 520
;
