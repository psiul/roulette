select count(ss.ss_item_sk)
from store_sales ss,customer c,store_returns sr,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 124 and c.c_hash <= 524 and i.i_hash >= 551 and i.i_hash <= 884 and cd.cd_hash >= 219 and cd.cd_hash <= 969
;
