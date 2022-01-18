select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,customer c,store_returns sr
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and hd.hd_hash >= 198 and hd.hd_hash <= 598 and cd.cd_hash >= 410 and cd.cd_hash <= 743 and c.c_hash >= 173 and c.c_hash <= 923
;
