select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer_demographics cd,store_returns sr
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and i.i_hash >= 566 and i.i_hash <= 899 and hd.hd_hash >= 307 and hd.hd_hash <= 707 and cd.cd_hash >= 76 and cd.cd_hash <= 826
;
