select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,customer c,store_returns sr
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 150 and ss.ss_hash <= 550 and hd.hd_hash >= 130 and hd.hd_hash <= 463 and cd.cd_hash >= 154 and cd.cd_hash <= 904
;
