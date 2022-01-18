select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i,store_returns sr
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 443 and ss.ss_hash <= 776 and cd.cd_hash >= 520 and cd.cd_hash <= 920 and i.i_hash >= 179 and i.i_hash <= 929
;
