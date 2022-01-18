select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,store_returns sr,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 235 and hd.hd_hash <= 985 and cd.cd_hash >= 392 and cd.cd_hash <= 725 and c.c_hash >= 454 and c.c_hash <= 854
;
