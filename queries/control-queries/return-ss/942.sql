select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,household_demographics hd,store_returns sr
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and cd.cd_hash >= 169 and cd.cd_hash <= 919 and i.i_hash >= 195 and i.i_hash <= 595 and hd.hd_hash >= 306 and hd.hd_hash <= 639
;
