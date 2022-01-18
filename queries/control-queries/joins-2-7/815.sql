select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 4 and ss.ss_hash <= 204 and i.i_hash >= 101 and i.i_hash <= 601
;
