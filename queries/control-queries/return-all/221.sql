select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer_demographics cd,household_demographics hd,item i
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and sr.sr_item_sk = i.i_item_sk and ss.ss_hash >= 135 and ss.ss_hash <= 885 and cd.cd_hash >= 520 and cd.cd_hash <= 920 and i.i_hash >= 641 and i.i_hash <= 974
;
