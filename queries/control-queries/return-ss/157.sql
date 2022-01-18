select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,store_returns sr,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 470 and cd.cd_hash <= 870 and c.c_hash >= 451 and c.c_hash <= 784 and hd.hd_hash >= 203 and hd.hd_hash <= 953
;
