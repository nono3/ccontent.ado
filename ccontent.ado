/* Stataのパッケージの中身を表示するプログラムを書いてみた。結構強引。 */

capture program drop ccontent

program ccontent
	syntax namelist
	tempfile temp
	tempfile temp2

	capture log close
	capture log using `temp',text nomsg replace
	which `*'
	log close

	capture log using `temp2',text nomsg replace
	di `"type ""' _continue
	type `temp', lines(1)
	di `"""'
	log close

	do `temp2'
end

* コマンド実行例
ccontent help
