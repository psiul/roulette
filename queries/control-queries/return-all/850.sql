select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,store_returns sr
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 650 and ss.ss_hash <= 983 and hd.hd_hash >= 396 and hd.hd_hash <= 796 and cd.cd_hash >= 129 and cd.cd_hash <= 879
;
