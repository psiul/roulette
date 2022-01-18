select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,store_returns sr,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 509 and ss.ss_hash <= 909 and c.c_hash >= 252 and c.c_hash <= 585 and cd.cd_hash >= 104 and cd.cd_hash <= 854
;
